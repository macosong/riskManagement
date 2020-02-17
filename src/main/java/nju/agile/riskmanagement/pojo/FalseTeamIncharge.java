package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * FalseTeamIncharge
 *
 * 虚开团伙负责人表
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FalseTeamIncharge {
    //团伙负责人表ID
    private int inchargeId;
    //团伙负责人姓名
    private String inchargePerName;
    //团伙负责人真实ID（证件号）
    private int inchargePerId;
    //负责人所在企业，企业纳税人ID
    private int taxPayerId;
}
