package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.AdminInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * AdminLogMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface AdminLogMapper {
    int checkExists(String adminName);
    AdminInfo checkLog(String adminName);
    void addAdmin(AdminInfo admin_info);
}
