package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * BlackList
 *
 * 黑名单
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class BlackList {
    //黑名单ID
    private int blackListId;
    //企业纳税人ID
    private int taxPayerId;
    //企业纳税人姓名
    private String taxPayerName;
}
