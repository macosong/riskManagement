package nju.agile.riskmanagement.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * StandardWords
 *
 * 标准词库
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class StandardWords {
    //标准词库ID
    private int standardPurId;
    //标准商品名
    private String standardPurName;
    //商品所属大类
    private String firstCategory;
    //商品所属中类
    private String secondCategory;
    //商品所属小类
    private String thirdCategory;
    //模拟词库ID
    private int simulationId;
}
