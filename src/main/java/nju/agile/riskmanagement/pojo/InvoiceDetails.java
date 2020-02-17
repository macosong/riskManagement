package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * InvoiceDetails
 *
 * 发票详细
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class InvoiceDetails {
    //发票ID
    private int invoiceId;
    //发票日期
    private String invoiceDate;
    //购货公司纳税人ID
    private int buyerTaxPayerId;
    //货物名称
    private String purName;
    //货物购买金额
    private String purAmount;
    //货物购买日期
    private String purSaleDate;
    //销售公司纳税人ID
    private int providerTaxPayerId;
}
