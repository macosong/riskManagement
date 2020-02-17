package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * EnterpriseInfo
 *
 * 企业信息
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class EnterpriseInfo {
    //公司纳税人ID
    private int taxPayerId;
    //公司纳税人名字
    private String taxPayerName;
    //公司地址
    private String enterAddress;
    //公司税务登记日期
    private String taxLogDate;
    //主管税务机关名称
    private String taxAuthorityName;
    //注册地
    private String admRegion;
    //法定代表人ID
    private int legalRepId;
    //法定代表人姓名
    private String legalRepName;
    //财务负责人ID
    private int financialPerId;
    //财务负责人姓名
    private String financialPerName;
    //获取密码
    private EnterLog enterLog;
}
