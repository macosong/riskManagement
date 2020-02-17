package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * MatchDetail
 *
 * 货物多项匹配
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class MatchDetail {
    //主键
    public int matchId;
    //发票中货物名称
    public String purName;
    //发票ID
    public int invoiceId;
    //匹配具体内容（模拟词库编号-模拟词库名称：1-豆油）
    public String matchContent;
    //是否已经审核？审核为1，未审核为0
    public int matchFlag;
    //最终匹配
    public SimulationWords simulation_words;
}
