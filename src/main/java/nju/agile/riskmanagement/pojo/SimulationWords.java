package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * SimulationWords
 *
 * 模拟词库
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class SimulationWords {
    //模拟词库ID
    private int simulationId;
    //模拟商品名
    private String simulationName;
}
