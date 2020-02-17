package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * MatchMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface MatchMapper {
    /**
     * 列表
     */
    List<MatchDetail> getMatchDetail();

    /**
     * 获取商品名
     */
    StandardWords getPurName(int simulationId);

    /**
     * 获取发票详情（购货和售货方ID，日期，金额）
     */
    InvoiceDetails getInvoice(int invoiceId);

    /**
     * 添加至购货台账
     */
    void addToBuy(LedgerIn ledger_in);

    /**
     * 添加至售货台账
     */
    void addToPur(LedgerOut ledger_out);

    /**
     * 更新审查状态
     */
    void upMatchFlag(int matchId);
}
