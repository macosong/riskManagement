package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * FalseTeamDetail
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FalseTeamDetail {
    //自增ID
    public int falseDetailId;
    //对应团伙ID
    public int falseTeamId;
    //企业负责人ID
    public int taxPayerId;
    //企业负责人姓名
    public String taxPayerName;
}
