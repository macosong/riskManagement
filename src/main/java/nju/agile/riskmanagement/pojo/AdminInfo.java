package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * AdminInfo
 *
 * 管理员登录信息
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class AdminInfo {
    //管理员ID
    private int adminId;
    //管理员姓名
    private String adminName;
    //管理员登录密码
    private String adminPass;
}
