package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.FalseMapper;
import nju.agile.riskmanagement.pojo.FalseEnterInfo;
import nju.agile.riskmanagement.pojo.FalsePurInfo;
import nju.agile.riskmanagement.pojo.FalseTeam;
import nju.agile.riskmanagement.pojo.FalseTeamDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * FalseService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class FalseService {
    @Autowired
    FalseMapper falseMapper;

    //获取虚开企业列表
    public List<FalseEnterInfo> getAllFalseEnter(int page, int rows){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("false_enter_id asc");
        List<FalseEnterInfo> false_enter_infos = falseMapper.getAllFalseEnter();
        return false_enter_infos;
    }

    //获取虚开货物详情
    public List<FalsePurInfo> getPurFalse(int falseEnterId, int page, int rows){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("false_pur_id asc");
        List<FalsePurInfo> false_pur_infos = falseMapper.getPurFalse(falseEnterId);
        return false_pur_infos;
    }

    //获取虚开团伙信息
    public List<FalseTeam> getFalseTeamAIncharge(int page, int rows){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("false_team_id asc");
        List<FalseTeam> false_teams = falseMapper.getFalseTeamAIncharge();
        return false_teams;
    }

    //获取虚开团伙详情
    public List<FalseTeamDetail> getFalseTeamD(int falseTeamId, int page, int rows){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("false_detail_id asc");
        List<FalseTeamDetail> false_team_details = falseMapper.getFalseTeamD(falseTeamId);
        return false_team_details;

    }
}
