package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.MatchMapper;
import nju.agile.riskmanagement.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * MatchService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class MatchService {
    @Autowired
    MatchMapper matchMapper;

    //显示列表
    public List<MatchDetail> getMatchDetail(int page, int rows){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("match_id asc");
        List<MatchDetail> match_details = matchMapper.getMatchDetail();

        return match_details;
    }

    //审查
    public void checkWords(MatchDetail match_detail) {
        int simulationId = match_detail.getSimulation_words().getSimulationId();
        int invoiceId = match_detail.getInvoiceId();
        int matchId = match_detail.getMatchId();
        LedgerIn ledger_in = new LedgerIn();
        LedgerOut ledger_out = new LedgerOut();

        StandardWords standard_words = matchMapper.getPurName(simulationId);
        int standardPurId = standard_words.getStandardPurId();
        String purName = standard_words.getStandardPurName();

        InvoiceDetails invoice_details = matchMapper.getInvoice(invoiceId);
        int buyer_taxPayer_id = invoice_details.getBuyerTaxPayerId();
        int provider_taxPayer_id = invoice_details.getProviderTaxPayerId();
        String dateString = invoice_details.getInvoiceDate();
        String amount = invoice_details.getPurAmount();

        ledger_in.setLedgerDate(dateString);
        ledger_in.setTaxPayerId(buyer_taxPayer_id);
        ledger_in.setPurAmount(amount);
        ledger_in.setStandardPurId(standardPurId);
        ledger_in.setStandardPurName(purName);
        ledger_in.setInvoiceId(invoiceId);

        matchMapper.addToBuy(ledger_in);

        ledger_out.setLedgerDate(dateString);
        ledger_out.setPurAmount(amount);
        ledger_out.setStandardPurId(standardPurId);
        ledger_out.setStandardPurName(purName);
        ledger_out.setTaxPayerId(provider_taxPayer_id);
        ledger_out.setInvoiceId(invoiceId);

        matchMapper.addToPur(ledger_out);

        matchMapper.upMatchFlag(matchId);
    }

}
