package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.SimulationWords;
import nju.agile.riskmanagement.service.SimulationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * SimulationController
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Controller
public class SimulationController {
    @Autowired
    SimulationService simulationService;

    /*
     * 显示列表
     */
    @RequestMapping("view_simulation.action")
    @ResponseBody
    public PageInfo<SimulationWords> viewSimu(@RequestParam(required=false,defaultValue="1") int page,
                                              @RequestParam(required=false,defaultValue="2") int rows, HttpServletRequest request){

        List<SimulationWords> simulation_words = new ArrayList<>();

        simulation_words = simulationService.getSimulation(page, rows);

        PageInfo<SimulationWords> pageInfo = new PageInfo<>(simulation_words);

        return pageInfo;

    }

    /*
     * 编辑
     */
    @RequestMapping("edit_simulation.action")
    public String editSimulation(SimulationWords simulation_words) {

        simulationService.editSimulation(simulation_words);

        return "redirect:view_simulation.jsp";
    }

    /*
     * 添加
     */
    @RequestMapping("add_simulation.action")
    public String addSimulation(SimulationWords simulation_words) {
        simulationService.addSimulation(simulation_words);

        return "redirect:view_simulation.jsp";
    }

    /*
     * 删除
     */
    @RequestMapping("del_simulation.action")
    public String delSimulation(int simulationId) {

        simulationService.delSimulation(simulationId);

        return "redirect:view_simulation.jsp";
    }
}
