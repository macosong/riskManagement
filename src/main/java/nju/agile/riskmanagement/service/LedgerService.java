package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.LedgerMapper;
import nju.agile.riskmanagement.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class LedgerService {
    @Autowired
    LedgerMapper ledgerMapper;

    /*
     * 显示购货台账
     */
    public List<LedgerIn> getBuy(int page, int rows, int taxPayerId){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("ledger_in_id asc");
        List<LedgerIn> ledger_ins = ledgerMapper.getBuy(taxPayerId);

        return ledger_ins;
    }

    /*
     * 显示售货台账
     */
    public List<LedgerOut> getPur(int page, int rows, int taxPayerId){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("ledger_out_id asc");
        List<LedgerOut> ledger_outs = ledgerMapper.getPur(taxPayerId);

        return ledger_outs;
    }

    /*
     * 季度查账
     */
    public void checkAllAccount() {
        //获取系统时间，年份和月份->季度
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);

        //季度
        int range=0;
        if(month>0&&month<4)
            range=1;
        else if (month>3&&month<7) {
            range=2;
        }else if (month>6&&month<10) {
            range=3;
        }else if (month>9&&month<13) {
            range=4;
        }

        //获取所有企业
        List<EnterpriseInfo> enterprise_infos = ledgerMapper.getAllEnterInfo();
        //获取所有企业ID
        List<Integer> enterId = new ArrayList<Integer>();
        for(int i=0;i<enterprise_infos.size();i++) {
            enterId.add(enterprise_infos.get(i).getTaxPayerId());
        }

        //根据ID查找本季度所有企业的台账并比较
        for(int i=0;i<enterId.size();i++) {
            //企业ID
            int enterTaxId = enterId.get(i);
            //获取该企业全部购货台账
            List<LedgerIn> ledger_ins = ledgerMapper.getBuy(enterTaxId);
            //本季度的全部购货台账
            List<LedgerIn> thisLedgerIn = new ArrayList<LedgerIn>();

            //获取本季度的购货台账
            for(int j=0;j<ledger_ins.size();j++) {
                if(judgeDate(ledger_ins.get(j).getLedgerDate(), range, year))
                    thisLedgerIn.add(ledger_ins.get(j));
            }

            //获取该企业全部售货台账
            List<LedgerOut> ledger_outs = ledgerMapper.getPur(enterTaxId);
            //本季度的全部售货台账
            List<LedgerOut> thisLedgerOut = new ArrayList<LedgerOut>();

            //获取本季度的售货台账
            for(int k=0;k<ledger_outs.size();k++) {
                if(judgeDate(ledger_outs.get(k).getLedgerDate(), range, year))
                    thisLedgerOut.add(ledger_outs.get(k));
            }

            //货物和购买总价
            HashMap<Integer,Integer> inTotalHash = new HashMap<Integer, Integer>();
            //货物和购买次数
            HashMap<Integer, Integer> inCountHash = new HashMap<Integer, Integer>();

            //遍历本季度的购货台账，填充hashMap，将台账分成货物-总价  货物-笔数
            for(int r=0;r<thisLedgerIn.size();r++) {
                //货物ID
                int st_id = thisLedgerIn.get(r).getStandardPurId();
                //购买金额
                int st_amount = Integer.valueOf(thisLedgerIn.get(r).getPurAmount());

                //填充数据
                if(inCountHash.containsKey(st_id)) {
                    int amount = inCountHash.get(st_id);
                    amount=amount+1;
                    inCountHash.put(st_id, amount);

                    int totalCash = inTotalHash.get(st_id);
                    totalCash = totalCash+st_amount;
                    inTotalHash.put(st_id, totalCash);

                }else {
                    inCountHash.put(st_id, 1);
                    inTotalHash.put(st_id, st_amount);
                }

            }


            //货物和销售总价
            HashMap<Integer,Integer> outTotalHash = new HashMap<Integer, Integer>();
            //货物和销售次数
            HashMap<Integer, Integer> outCountHash = new HashMap<Integer, Integer>();

            //遍历本季度的售货台账，填充hashMap，将台账分成货物-总价  货物-笔数
            for(int r=0;r<thisLedgerOut.size();r++) {
                //货物ID
                int st_id = thisLedgerOut.get(r).getStandardPurId();
                //购买金额
                int st_amount = Integer.valueOf(thisLedgerOut.get(r).getPurAmount());

                //填充数据
                if(outCountHash.containsKey(st_id)) {
                    int amount = outCountHash.get(st_id);
                    amount=amount+1;
                    outCountHash.put(st_id, amount);

                    int totalCash = outTotalHash.get(st_id);
                    totalCash = totalCash+st_amount;
                    outTotalHash.put(st_id, totalCash);

                }else {
                    outCountHash.put(st_id, 1);
                    outTotalHash.put(st_id, st_amount);
                }

            }

            //对比台账
            for(Integer key:inTotalHash.keySet()) {
                //如果两个台账中含有同一个货物
                if(outTotalHash.containsKey(key)) {
                    //购货总额
                    int inTotal = inTotalHash.get(key);
                    //购货笔数
                    int inCount = inCountHash.get(key);
                    //售货总额
                    int outTotal = outTotalHash.get(key);
                    //售货笔数
                    int outCount = outCountHash.get(key);
                    //对比结果
                    String compareResult="";

                    if(inTotal>outTotal) {
                        compareResult = "进大于销";

                    }else if (inTotal<outTotal) {
                        compareResult = "销大于进";
                    }

                    if(!compareResult.equals("")) {
                        NotMatchInfo not_match_info = new NotMatchInfo();
                        not_match_info.setBuyAmount(String.valueOf(inCount));
                        not_match_info.setCompareDate(String.valueOf(range));
                        not_match_info.setCompareResult(compareResult);
                        not_match_info.setPurAmount(String.valueOf(outCount));
                        not_match_info.setRiskCheckFlag("N");
                        not_match_info.setStandardPurId(key);

                        StandardWords s_Words = ledgerMapper.getPurName(key);
                        String standardPurName = s_Words.getStandardPurName();

                        not_match_info.setStandardPurName(standardPurName);
                        not_match_info.setTaxPayerId(enterTaxId);
                        not_match_info.setThisTotalBuy(String.valueOf(inTotal));
                        not_match_info.setThisTotalSale(String.valueOf(outTotal));

                        ledgerMapper.addToNotMatch(not_match_info);
                    }

                }
            }

        }
    }

    //判断日期是否满足条件
    public boolean judgeDate(String dateString,int range,int year) {
        int realYear = Integer.valueOf(dateString.substring(0, 4));
        int realMonth = Integer.valueOf(dateString.substring(5, 7));
        int realRange=0;

        if(realMonth>0&&realMonth<4)
            realRange=1;
        else if (realMonth>3&&realMonth<7) {
            realRange=2;
        }else if (realMonth>6&&realMonth<10) {
            realRange=3;
        }else if (realMonth>9&&realMonth<13) {
            realRange=4;
        }

        if(realYear==year&&realRange==range)
            return true;

        return false;
    }




}
