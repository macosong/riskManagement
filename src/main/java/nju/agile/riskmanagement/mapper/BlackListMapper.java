package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.BlackList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * BlackListMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface BlackListMapper {
    List<BlackList> getBlack();
}
