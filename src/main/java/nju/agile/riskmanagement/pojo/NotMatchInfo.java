package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * NotMatchInfo
 *
 * 不匹配清单
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class NotMatchInfo {
    //不匹配清单ID
    private int notMatchId;
    //企业纳税人ID
    private int taxPayerId;
    //对比日期
    private String compareDate;
    //对比结果（销售大于进货，有进货无销售）
    private String compareResult;
    //标准货物Id
    private int standardPurId;
    //标准货物名称
    private String standardPurName;
    //销售总金额
    private String purAmount;
    //购进总金额
    private String buyAmount;
    //本期总销售额
    private String thisTotalSale;
    //本期总购进额
    private String thisTotalBuy;
    //风险核实标志
    private String riskCheckFlag;
    //风险核实结果（Y/N）
    private String riskCheckResult;
}
