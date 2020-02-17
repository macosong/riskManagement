package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * EnterLog
 *
 * 企业登录账号
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class EnterLog {
    //企业登录ID
    private int enterLogId;
    //企业登录密码
    private String enterLogPass;
    //企业纳税人ID
    private int taxPayerId;
}
