package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.SimulationMapper;
import nju.agile.riskmanagement.pojo.SimulationWords;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * SimulationService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class SimulationService {
    @Autowired
    SimulationMapper simulationMapper;

    /*
     * 显示列表
     */
    public List<SimulationWords> getSimulation(int page, int rows){

        PageHelper.startPage(page, rows);
        PageHelper.orderBy("simulation_word_id asc");
        List<SimulationWords> simulation_words = simulationMapper.getSimulation();

        return simulation_words;

    }

    /*
     * 编辑
     */
    public void editSimulation(SimulationWords simulation_words) {
        simulationMapper.editSimulation(simulation_words);
    }

    /*
     * 添加
     */
    public void addSimulation(SimulationWords simulation_words) {
        simulationMapper.addSimulation(simulation_words);

    }

    /*
     * 删除
     */
    public void delSimulation(int simulationId) {
        simulationMapper.delSimulation(simulationId);
    }
}
