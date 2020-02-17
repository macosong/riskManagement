package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * FalseTeam
 *
 * 虚开团伙
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class FalseTeam {
    //虚开团伙ID
    private int falseTeamId;
    //虚开团伙类型（法定代表人相同、财务负责人相同、法定代表人财务负责人相同）
    private String falseTeamType;
    //团伙负责人表ID
    private int inchargeId;
    //负责人
    private FalseTeamIncharge falseTeamIncharge;
}
