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
     *
     * @param taxPayerId
     * @return
     */
    EnterpriseInfo showEnterDetail(int taxPayerId);

    /**
     * 修改企业信息
     *
     * @param enterprise_info
     */
    void editEnterDetail(EnterpriseInfo enterprise_info);

    /**
     * 修改企业密码
     *
     * @param enter_log
     */
    void editEnterPass(EnterLog enter_log);

    /**
     * 企业注册
     *
     * @param enterprise_info
     */
    void enterRegister(EnterpriseInfo enterprise_info);

    /**
     * 企业注册密码
     *
     * @param enter_log
     */
    void enterRe(EnterLog enter_log);
}
