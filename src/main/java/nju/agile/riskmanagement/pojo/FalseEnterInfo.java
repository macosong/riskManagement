package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * FalseEnterInfo
 *
 * 虚开企业清单
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FalseEnterInfo {
    //虚开企业清单编号
    private int falseEnterId;
    //企业纳税人ID
    private int taxPayerId;
    //企业纳税人姓名
    private String taxPayerName;
    //虚开月份
    private String falseMonth;
    //虚开总金额
    private String falseAmount;
}
