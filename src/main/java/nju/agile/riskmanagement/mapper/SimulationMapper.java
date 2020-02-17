package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.SimulationWords;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * SimulationMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface SimulationMapper {
    /**
     * 列表
     */
    List<SimulationWords> getSimulation();

    /**
     * 编辑
     */
    void editSimulation(SimulationWords simulation_words);

    /**
     * 添加
     */
    public void addSimulation(SimulationWords simulation_words);

    /**
     * 删除
     */
    public void delSimulation(int simulationId);
}
