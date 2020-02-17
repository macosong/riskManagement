package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * LedgerOut
 *
 * 销售台账
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class LedgerOut {
    //销售台账ID
    private int ledgerOutId;
    //销售日期
    private String ledgerDate;
    //销售货物总额
    private String purAmount;
    //标准货物ID
    private int standardPurId;
    //标准货物名称
    private String standardPurName;
    //企业纳税人ID
    private int taxPayerId;
    //发票ID
    private int invoiceId;
}
