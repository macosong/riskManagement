package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * FalsePurInfo
 *
 * 虚开货物明细
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FalsePurInfo {
    //虚开货物明细编号
    private int falsePurId;
    //虚开企业ID
    private int taxPayerId;
    //发票Id
    private int invoiceId;
    //发票日期
    private String invoiceDate;
    //商品名
    private String purName;
    //货物金额
    private String purAmount;
    //标准货物编号
    private int standardPurId;
    //标准货物名称
    private String standardPurName;
    //所属企业
    private int falseEnterId;
}
