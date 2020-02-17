package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.InvoiceMapper;
import nju.agile.riskmanagement.mapper.MatchMapper;
import nju.agile.riskmanagement.mapper.SimulationMapper;
import nju.agile.riskmanagement.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * InvoiceService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class InvoiceService {
    @Autowired
    InvoiceMapper invoiceMapper;

    @Autowired
    SimulationMapper simulationMapper;

    @Autowired
    MatchMapper matchMapper;

    /*
     * 上传发票
     */
    public void upInvoice(InvoiceDetails invoice_details) {

        invoiceMapper.upInvoice(invoice_details);
    }

    /*
     * 查看发票列表
     */
    public List<InvoiceDetails> getInvoice(int taxPayerId, int page, int rows){

        PageHelper.startPage(page, rows);
        PageHelper.orderBy("invoice_id asc");
        List<InvoiceDetails> invoice_details_li = invoiceMapper.getInvoice(taxPayerId);

        return invoice_details_li;
    }

    //匹配发票货物
    public void match(InvoiceDetails invoice_details) {

        String pur_name = invoice_details.getPurName();

        //获取模拟词库所有词条
        List<SimulationWords> simulation_words = simulationMapper.getSimulation();

        //匹配成功的词库ID列表
        List<Integer> matchList = new ArrayList<Integer>();

        //匹配成功的词库内容
        List<String> matchStrings = new ArrayList<String>();

        //遍历列表，将模拟词库词条作为匹配字符串，与输入的货物名称进行匹配
        //采用KMP匹配算法
        for(int i=0;i<simulation_words.size();i++) {
            String matchString = simulation_words.get(i).getSimulationName();
            int matchSimId = simulation_words.get(i).getSimulationId();

            if(kmpMatch(pur_name, matchString)) {
                //匹配的ID
                matchList.add(matchSimId);
                //匹配的内容
                matchStrings.add(matchString);
            }

        }
        //如果只匹配到一条，直接加入售货和购货台账中
        if(matchList.size()==1) {
            addToLedger(invoice_details, matchList.get(0));
        }else if(matchList.size()==0||matchList.size()>1) {
            //如果没有匹配到或者匹配到多项数据，加入到审核表中进行人工审核
            int invoiceId = invoice_details.getInvoiceId();
            String invoiceString = invoice_details.getPurName();
            addToDetails(invoiceId, invoiceString, matchList,matchStrings);
        }


    }

    //KMP匹配算法
    public boolean kmpMatch(String purName,String simName) {
        //purName是待匹配的字符串
        //simName是匹配串

        int[] N=getN(simName);
        int res=0;
        int sourceLength=purName.length();
        int patternLength=simName.length();
        for(int i=0;i<=(sourceLength-patternLength);){
            res++;
            String str=purName.substring(i, i+patternLength);//要比较的字符串

            int count=getNext(simName, str,N);

            if(count==0){
                return true;

            }
            i=i+count;
        }

        return false;
    }

    /**
     * 得到下一次要移动的次数
     *
     * @param pattern
     * @param str
     * @param N
     * @return 0,字符串匹配；
     */
    private static int getNext(String pattern,String str,int[] N) {
        int n = pattern.length();
        char v1[] = str.toCharArray();
        char v2[] = pattern.toCharArray();
        int x = 0;
        while (n-- != 0) {
            if (v1[x] != v2[x]){
                if(x==0){
                    return 1;//如果第一个不相同，移动1步
                }
                return x-N[x-1];//x:第一次出现不同的索引的位置，即j
            }
            x++;
        }
        return 0;
    }
    private static int[] getN(String pattern) {
        char[] pat=pattern.toCharArray();
        int j=pattern.length()-1;
        int[] N=new int[j+1];
        for(int i=j;i>=2;i--){
            N[i-1]=getK(i,pat);
        }
        return N;
    }
    private static int getK(int j, char[] pat) {
        int x=j-2;
        int y=1;
        while (x>=0 && compare(pat, 0, x, y, j-1)) {
            x--;
            y++;
        }
        return x+1;
    }

    private static boolean compare(char[] pat,int b1,int e1,int b2,int e2){
        int n = e1-b1+1;
        while (n-- != 0) {
            if (pat[b1] != pat[b2]){
                return true;
            }
            b1++;
            b2++;
        }
        return false;
    }

    //添加至台账
    public void addToLedger(InvoiceDetails invoice_details,int simulationId) {

        int invoiceId = invoice_details.getInvoiceId();
        String dateString = invoice_details.getInvoiceDate();
        String amount = invoice_details.getPurAmount();
        int taxBuyerId = invoice_details.getBuyerTaxPayerId();
        int taxProId = invoice_details.getProviderTaxPayerId();

        StandardWords standard_words = matchMapper.getPurName(simulationId);
        int standardPurId = standard_words.getStandardPurId();
        String purName = standard_words.getStandardPurName();

        //购货台账
        LedgerIn ledger_in = new LedgerIn();

        ledger_in.setInvoiceId(invoiceId);
        ledger_in.setLedgerDate(dateString);
        ledger_in.setPurAmount(amount);
        ledger_in.setStandardPurId(standardPurId);
        ledger_in.setStandardPurName(purName);
        ledger_in.setTaxPayerId(taxBuyerId);

        matchMapper.addToBuy(ledger_in);

        //售货台账
        LedgerOut ledger_out = new LedgerOut();

        ledger_out.setInvoiceId(invoiceId);
        ledger_out.setLedgerDate(dateString);
        ledger_out.setPurAmount(amount);
        ledger_out.setStandardPurId(standardPurId);
        ledger_out.setStandardPurName(purName);
        ledger_out.setTaxPayerId(taxProId);

        matchMapper.addToPur(ledger_out);


    }

    //添加至匹配表
    public void addToDetails(int invoiceId,String invoiceString,List<Integer> simNum,List<String> simName) {
        //匹配详情
        String matchContent = " ";

        //获取匹配详情
        for(int i=0;i<simName.size();i++) {

            matchContent=matchContent.concat(String.valueOf(simNum.get(i)));
            matchContent=matchContent.concat("-");
            matchContent=matchContent.concat(simName.get(i));

            //matchContent.concat(simNum.get(i)+"-"+simName.get(i));

        }
        System.out.println(matchContent);

        //添加至匹配详情表
        MatchDetail match_detail = new MatchDetail();

        match_detail.setInvoiceId(invoiceId);
        match_detail.setMatchContent(matchContent);
        match_detail.setMatchFlag(0);
        match_detail.setPurName(invoiceString);

        invoiceMapper.upMatchDetail(match_detail);

    }





}
