package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.BlackListMapper;
import nju.agile.riskmanagement.pojo.BlackList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * BlackListServce
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class BlackListService {
    @Autowired
    BlackListMapper blackListMapper;

    /*
     * 查看黑名单
     */
    public List<BlackList> getBlack(int page, int rows){
        PageHelper.startPage(page, rows);
        PageHelper.orderBy("black_list_id asc");
        List<BlackList> black_lists = blackListMapper.getBlack();

        return black_lists;

    }
}
