package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * UnmatchMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface UnmatchMapper {
    /**
     * 获取不匹配企业信息
     */
    List<NotMatchInfo> getAllUnmatch();

    /**
     * 风险核实
     */
    void checkUnmatchResult(NotMatchInfo not_match_info);

    /**
     * 核实的加入到虚开企业表中
     */
    void addToFalseEnter(FalseEnterInfo false_enter_info);

    /**
     * 根据纳税人ID和季度获得相应的本季度的虚开企业数据
     */
    FalseEnterInfo getFalseEnter(@Param("taxPayerId")int taxPayerId, @Param("month")String falseMonth);

    /**
     * 根据标准货物ID，taxPayerID找到invoiceId（购货台账）
     */
    List<LedgerIn> getInInvoice(@Param("taxPayerId")int taxPayerId, @Param("standardPurId")int standardPurId);

    /**
     * 根据标准货物ID，taxPayerID找到invoiceId（售货台账）
     */
    List<LedgerOut> getOutInvoice(@Param("taxPayerId")int taxPayerId, @Param("standardPurId")int standardPurId);

    /**
     * 获取invoice详情
     */
    InvoiceDetails getInvoice(int invoiceId);

    /**
     * 商品信息写入数据库
     */
    void addToPurFalse(FalsePurInfo false_pur_info);

    EnterpriseInfo getBlackName(int taxPayerId);

    /**
     * 把企业加入黑名单
     */
    void addToBlack(BlackList black_list);

    /**
     * 形成团伙,获取其他企业信息
     */
    List<EnterpriseInfo> getOtherEnter(int taxPayerId);

    /**
     * 添加团伙负责人信息
     */
    void addTeamIncharge(FalseTeamIncharge false_team_incharge);

    /**
     * 获取新加入的负责人
     */
    FalseTeamIncharge getLatestId();

    /**
     * 把团伙ID加到表中
     */
    void addFalseTeam(FalseTeam false_team);

    /**
     * 获取新加入的团伙ID
     */
    FalseTeam getFalseTeamId();

    /**
     * 插入团伙详情
     */
    void addTeamDetail(FalseTeamDetail false_team_detail);
}
