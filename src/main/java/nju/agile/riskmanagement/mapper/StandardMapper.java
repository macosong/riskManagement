package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.SAndS;
import nju.agile.riskmanagement.pojo.StandardWords;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * StandardMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface StandardMapper {
    /**
     * 列表
     */
    List<StandardWords> getStandard();

    /**
     * 删除
     */
    void delStandard(int standardPurId);

    /**
     * 编辑
     */
    void editStandard(StandardWords standard_words);

    /**
     * 添加匹配
     */
    void addMatch(SAndS s_and_S);

    /**
     * 添加词条
     */
    void addStandard(StandardWords standard_words);
}
