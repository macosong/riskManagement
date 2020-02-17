package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.EnterLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * EnterLogMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface EnterLogMapper {
    EnterLog checkLog(int taxPayerId);
    int checkExists(int taxPayerId);
}
