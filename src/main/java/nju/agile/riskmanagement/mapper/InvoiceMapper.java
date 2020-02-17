package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.InvoiceDetails;
import nju.agile.riskmanagement.pojo.MatchDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * InvoiceMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface InvoiceMapper {
    /**
     * 上传
     */
    void upInvoice(InvoiceDetails invoice_details);

    /**
     * 获取列表
     */
    List<InvoiceDetails> getInvoice(int taxPayerId);

    /**
     * 添加不匹配项
     */
    void upMatchDetail(MatchDetail match_detail);
}
