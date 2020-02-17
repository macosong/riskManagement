package nju.agile.riskmanagement.mapper;

import nju.agile.riskmanagement.pojo.EnterLog;
import nju.agile.riskmanagement.pojo.EnterpriseInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * EnterDetailMapper
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Mapper
public interface EnterDetailMapper {
    /**
     * 企业index界面显示企业详细信息
     */
    EnterpriseInfo showEnterDetail(int taxPayerId);

    /**
     * 修改企业信息
     */
    void editEnterDetail(EnterpriseInfo enterprise_info);

    /**
     * 修改企业密码
     */
    void editEnterPass(EnterLog enter_log);

    /**
     * 企业注册
     */
    void enterRegister(EnterpriseInfo enterprise_info);

    /**
     * 企业注册密码
     */
    void enterRe(EnterLog enter_log);
}
