package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.EnterDetailMapper;
import nju.agile.riskmanagement.mapper.UnmatchMapper;
import nju.agile.riskmanagement.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * UnmatchService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class UnmatchService {
    @Autowired
    UnmatchMapper unmatchMapper;

    @Autowired
    EnterDetailMapper enterDetailMapper;

    //获取全部列表
    public List<NotMatchInfo> getAllUnmatch(int page, int rows){

        PageHelper.startPage(page, rows);
        PageHelper.orderBy("not_match_id asc");
        List<NotMatchInfo> not_match_infos = unmatchMapper.getAllUnmatch();

        return not_match_infos;
    }

    //风险核实
    public void checkUnmatchResult(NotMatchInfo not_match_info) {

        unmatchMapper.checkUnmatchResult(not_match_info);

        //若确定不匹配，则加入到虚开企业名单中
        if(not_match_info.getRiskCheckResult().equals("Y")) {


            //将企业写入虚开企业表中
            addFalse_enter_info(not_match_info);

            //将对应的货物写入虚开货物表中
            addFalse_pur_info(not_match_info);

            //将企业加入黑名单
            addBlackList(not_match_info.getTaxPayerId());

            //核实虚开团伙
            checkTeam(not_match_info.getTaxPayerId());

        }
    }

    //将企业写入虚开企业表中
    public void addFalse_enter_info(NotMatchInfo not_match_info) {
        //虚开企业信息
        FalseEnterInfo false_enter_info = new FalseEnterInfo();
        //将企业写入虚开企业表中
        //纳税人ID（企业ID）
        int taxPayerId = not_match_info.getTaxPayerId();
        false_enter_info.setTaxPayerId(taxPayerId);
        //纳税人姓名
        String taxPayerName = enterDetailMapper.showEnterDetail(taxPayerId).getTaxPayerName();
        false_enter_info.setTaxPayerName(taxPayerName);
        //审核季度
        false_enter_info.setFalseMonth(not_match_info.getCompareDate());
        //虚开金额
        int sale = Integer.valueOf(not_match_info.getThisTotalSale());
        int buy = Integer.valueOf(not_match_info.getThisTotalBuy());
        int falseAmount = sale-buy;
        false_enter_info.setFalseAmount(String.valueOf(falseAmount));

        unmatchMapper.addToFalseEnter(false_enter_info);

    }

    //将对应的货物写入虚开货物表中
    public void addFalse_pur_info(NotMatchInfo not_match_info) {

        //获取纳税人ID
        int taxPayerId = not_match_info.getTaxPayerId();

        //获取审核季度，以确保是本季度的该公司货物
        String falseMonth = not_match_info.getCompareDate();

        //根据审核季度和纳税人ID获取本季度虚开的公司在本表中的ID
        FalseEnterInfo false_enter_info = unmatchMapper.getFalseEnter(taxPayerId, falseMonth);
        int false_enter_id = false_enter_info.getFalseEnterId();

        //标准货物ID
        int standard_pur_id = not_match_info.getStandardPurId();

        //标准货物名称
        String standard_pur_name = not_match_info.getStandardPurName();

        //根据标准货物ID获取发票ID

        List<Integer> invoiceCollection = getInvoiceId(standard_pur_id,taxPayerId,falseMonth);

        //将符合的货物数据写入表中
        addToTable(invoiceCollection, taxPayerId, false_enter_id, standard_pur_id, standard_pur_name);


    }

    //根据标准货物ID获取发票ID
    public List<Integer> getInvoiceId(int standardId,int taxPayerId,String falseMonth) {
        //购货台账
        List<LedgerIn> ledger_ins = unmatchMapper.getInInvoice(taxPayerId, standardId);
        //售货台账
        List<LedgerOut> ledger_outs = unmatchMapper.getOutInvoice(taxPayerId, standardId);

        //购货台账中满足条件的invoiceID
        List<Integer> inInvoice = new ArrayList<Integer>();
        //售货台账中满足条件的invoiceID
        List<Integer> outInvoice = new ArrayList<Integer>();

        //获取购货台账中满足日期要求的invoiceId
        for(int i=0;i<ledger_ins.size();i++) {
            //获取invoice日期
            String dateString = ledger_ins.get(i).getLedgerDate();
            //截取月份以判断季度
            String compareMonth = dateString.substring(5, 7);
            int month = Integer.valueOf(compareMonth);
            //判断季度
            switch (falseMonth) {
                case "1":
                    if(month>0&&month<4)
                        inInvoice.add(ledger_ins.get(i).getInvoiceId());
                    break;
                case "2":
                    if(month>3&&month<7)
                        inInvoice.add(ledger_ins.get(i).getInvoiceId());
                    break;
                case "3":
                    if(month>6&&month<10)
                        inInvoice.add(ledger_ins.get(i).getInvoiceId());
                    break;
                case "4":
                    if(month>9&month<13)
                        inInvoice.add(ledger_ins.get(i).getInvoiceId());
                    break;
            }

        }

        //获取售货台账中满足日期要求的invoiceId
        for(int i=0;i<ledger_outs.size();i++) {
            //获取invoice日期
            String dateString = ledger_outs.get(i).getLedgerDate();
            //截取月份以判断季度
            String compareMonth = dateString.substring(5, 7);
            int month = Integer.valueOf(compareMonth);
            //判断季度
            switch (falseMonth) {
                case "1":
                    if(month>0&&month<4)
                        outInvoice.add(ledger_outs.get(i).getInvoiceId());
                    break;
                case "2":
                    if(month>3&&month<7)
                        outInvoice.add(ledger_outs.get(i).getInvoiceId());
                    break;
                case "3":
                    if(month>6&&month<10)
                        outInvoice.add(ledger_outs.get(i).getInvoiceId());
                    break;
                case "4":
                    if(month>9&month<13)
                        outInvoice.add(ledger_outs.get(i).getInvoiceId());
                    break;
            }

        }
        //去重
        for(int i=0;i<outInvoice.size();i++) {
            if(!inInvoice.contains(outInvoice.get(i))) {
                inInvoice.add(outInvoice.get(i));
            }
        }


        return inInvoice;
    }

    //将符合的货物数据写入表中
    public void addToTable(List<Integer> invoiceCollection,int taxPayerId,int falseEnterId,int standardPurId,String standardPurName) {

        for(int i=0;i<invoiceCollection.size();i++) {
            int invoiceId=invoiceCollection.get(i);
            //发票详细
            InvoiceDetails invoice_details = unmatchMapper.getInvoice(invoiceId);
            //虚开企业对应的商品详情
            FalsePurInfo false_pur_info = new FalsePurInfo();

            false_pur_info.setFalseEnterId(falseEnterId);
            false_pur_info.setInvoiceDate(invoice_details.getInvoiceDate());
            false_pur_info.setInvoiceId(invoiceId);
            false_pur_info.setPurAmount(invoice_details.getPurAmount());
            false_pur_info.setPurName(invoice_details.getPurName());
            false_pur_info.setStandardPurId(standardPurId);
            false_pur_info.setStandardPurName(standardPurName);
            false_pur_info.setTaxPayerId(taxPayerId);

            unmatchMapper.addToPurFalse(false_pur_info);

        }

    }

    //把企业加入黑名单
    public void addBlackList(int taxPayerId) {

        BlackList black_list = new BlackList();
        EnterpriseInfo enterprise_info = unmatchMapper.getBlackName(taxPayerId);
        String taxPayerName = enterprise_info.getTaxPayerName();

        black_list.setTaxPayerId(taxPayerId);
        black_list.setTaxPayerName(taxPayerName);
        unmatchMapper.addToBlack(black_list);
    }

    //核实虚开团伙
    public void checkTeam(int taxPayerId) {

        EnterpriseInfo enterprise_info =unmatchMapper.getBlackName(taxPayerId);
        int legal_id = enterprise_info.getLegalRepId();
        int fin_id = enterprise_info.getFinancialPerId();
        //获取其他企业信息
        List<EnterpriseInfo> enterprise_infos = unmatchMapper.getOtherEnter(taxPayerId);

        //类型一的企业
        List<EnterpriseInfo> enterList1 = new ArrayList<>();
        //类型二的企业
        List<EnterpriseInfo> enterList2 = new ArrayList<>();
        //类型三的企业
        List<EnterpriseInfo> enterList3 = new ArrayList<>();

        //遍历列表查看负责人
        for(int i=0;i<enterprise_infos.size();i++) {
            int com_legal_id = enterprise_infos.get(i).getLegalRepId();
            int com_fin_id = enterprise_infos.get(i).getFinancialPerId();


            //法人代表相同
            if(com_legal_id==legal_id&&com_fin_id!=fin_id) {
                enterList1.add(enterprise_infos.get(i));


            }else if (com_legal_id!=legal_id&&com_fin_id==fin_id) {
                enterList2.add(enterprise_infos.get(i));
                //财务负责人相同

            }else if (com_legal_id==legal_id&&com_fin_id==fin_id) {
                enterList3.add(enterprise_infos.get(i));
                //均相同

            }

        }

        if(!enterList1.isEmpty()) {
            String falseTeamType="法人代表相同";
            int flag=1;
            addFalseInfo(enterList1, falseTeamType, taxPayerId, flag);
        }

        if(!enterList2.isEmpty()) {
            String falseTeamType="财务负责人相同";
            int flag=2;
            addFalseInfo(enterList2, falseTeamType, taxPayerId, flag);
        }

        if(!enterList3.isEmpty()) {
            String falseTeamType="两个负责人均相同";
            int flag=3;
            addFalseInfo(enterList3, falseTeamType, taxPayerId, flag);
        }
    }

    //添加到表中
    public void addFalseInfo(List<EnterpriseInfo> enterList,String type,int taxPayerId,int flag) {

        int perId=0;
        if(flag==1||flag==3) {
            perId = enterList.get(0).getLegalRepId();
        }
        else if (flag==2) {
            perId = enterList.get(0).getFinancialPerId();
        }

        //把负责人加到表中,负责人是法人代表
        FalseTeamIncharge false_team_incharge = new FalseTeamIncharge();

        false_team_incharge.setInchargePerId(perId);
        false_team_incharge.setInchargePerName(enterList.get(0).getLegalRepName());
        false_team_incharge.setTaxPayerId(taxPayerId);
        unmatchMapper.addTeamIncharge(false_team_incharge);

        //获得刚刚插入的负责人表的ID
        FalseTeamIncharge false_team_incharge2 = unmatchMapper.getLatestId();
        int inchargeId  =false_team_incharge2.getInchargeId();

        //把信息插入到虚开团伙表中
        FalseTeam false_team = new FalseTeam();
        false_team.setFalseTeamType(type);
        false_team.setInchargeId(inchargeId);

        unmatchMapper.addFalseTeam(false_team);

        //获得刚刚加入的teamID
        FalseTeam false_team2 = unmatchMapper.getFalseTeamId();
        int falseTeamId = false_team2.getFalseTeamId();

        //插入详细信息
        for(int i=0;i<enterList.size();i++) {
            int tId=enterList.get(i).getTaxPayerId();
            String tName = enterList.get(i).getTaxPayerName();

            FalseTeamDetail false_team_detail = new FalseTeamDetail();
            false_team_detail.setFalseTeamId(falseTeamId);
            false_team_detail.setTaxPayerId(tId);
            false_team_detail.setTaxPayerName(tName);

            //插入
            unmatchMapper.addTeamDetail(false_team_detail);


        }
    }



}
