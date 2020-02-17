package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.FalseEnterInfo;
import nju.agile.riskmanagement.pojo.FalsePurInfo;
import nju.agile.riskmanagement.pojo.FalseTeam;
import nju.agile.riskmanagement.pojo.FalseTeamDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * FalseMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface FalseMapper {
    /**
     * 获取虚开企业清单
     */
    List<FalseEnterInfo> getAllFalseEnter();

    /**
     * 获取虚开货物详情
     */
    List<FalsePurInfo> getPurFalse(int falseEnterId);

    /**
     * /获取虚开团伙信息
     */
    List<FalseTeam> getFalseTeamAIncharge();

    /**
     * 获取虚开团伙详情
     */
    List<FalseTeamDetail> getFalseTeamD(int falseTeamId);
}
