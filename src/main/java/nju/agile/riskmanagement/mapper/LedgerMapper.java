package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * LedgerMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface LedgerMapper {
    /**
     * 显示购货台账
     */
    List<LedgerIn> getBuy(int taxPayerId);

    /**
     * 显示售货台账
     */
    List<LedgerOut> getPur(int taxPayerId);

    /**
     * 获取所有企业列表
     */
    List<EnterpriseInfo> getAllEnterInfo();

    /**
     * 获取商品名称
     */
    StandardWords getPurName(int standardPurId);

    /**
     * 添加不匹配
     */
    void addToNotMatch(NotMatchInfo not_match_info);
}
