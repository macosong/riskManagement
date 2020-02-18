package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.FalseEnterInfo;
import nju.agile.riskmanagement.pojo.FalsePurInfo;
import nju.agile.riskmanagement.pojo.FalseTeam;
import nju.agile.riskmanagement.pojo.FalseTeamDetail;
import nju.agile.riskmanagement.service.FalseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FalseController {
    @Autowired
    FalseService falseService;

    //获取全部虚开企业列表
    @RequestMapping("view_false_enter.action")
    @ResponseBody
    public PageInfo<FalseEnterInfo> getAllFalseEnter(@RequestParam(required=false,defaultValue="1") int page,
                                                     @RequestParam(required=false,defaultValue="1") int rows, HttpServletRequest request){

        List<FalseEnterInfo> false_enter_infos = new ArrayList<>();

        false_enter_infos = falseService.getAllFalseEnter(page, rows);

        PageInfo<FalseEnterInfo> pageInfo = new PageInfo<>(false_enter_infos);

        return pageInfo;
    }

    //获取虚开货物详情
    @RequestMapping("view_false_pur.action")
    @ResponseBody
    public PageInfo<FalsePurInfo> getPurInfo(Integer falseEnterId, @RequestParam(required=false,defaultValue="1") int page,
                                             @RequestParam(required=false,defaultValue="1") int rows, HttpServletRequest request){


        List<FalsePurInfo> false_pur_infos = new ArrayList<>();

        false_pur_infos = falseService.getPurFalse(falseEnterId, page, rows);

        PageInfo<FalsePurInfo> pageInfo = new PageInfo<>(false_pur_infos);

        return pageInfo;

    }

    //获取虚开团伙信息
    @RequestMapping("view_false_team.action")
    @ResponseBody
    public PageInfo<FalseTeam> getFalseTeam(@RequestParam(required=false,defaultValue="1") int page,
                                            @RequestParam(required=false,defaultValue="1") int rows, HttpServletRequest request){

        List<FalseTeam> false_teams = new ArrayList<>();
        false_teams = falseService.getFalseTeamAIncharge(page, rows);
        for(int i=0;i<false_teams.size();i++) {
            System.out.println(false_teams.get(i).getFalseTeamIncharge().getInchargeId());
        }
        PageInfo<FalseTeam> pageInfo = new PageInfo<>(false_teams);

        return pageInfo;

    }

    //获取虚开团伙详情
    @RequestMapping("view_false_teamD.action")
    @ResponseBody
    public PageInfo<FalseTeamDetail> getFalseTeamD(Integer falseTeamId, @RequestParam(required=false,defaultValue="1") int page,
                                                              @RequestParam(required=false,defaultValue="1") int rows, HttpServletRequest request){

        List<FalseTeamDetail> false_team_details = new ArrayList<>();

        false_team_details = falseService.getFalseTeamD(falseTeamId, page, rows);

        PageInfo<FalseTeamDetail> pageInfo  = new PageInfo<FalseTeamDetail>(false_team_details);
        return pageInfo;

    }

}
