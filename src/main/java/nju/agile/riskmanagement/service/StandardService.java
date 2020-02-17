package nju.agile.riskmanagement.service;

import com.github.pagehelper.PageHelper;
import nju.agile.riskmanagement.mapper.StandardMapper;
import nju.agile.riskmanagement.pojo.SAndS;
import nju.agile.riskmanagement.pojo.StandardWords;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * StandardService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class StandardService {
    @Autowired
    StandardMapper standardMapper;

    /*
     * 显示列表
     */
    public List<StandardWords> getStandard(int page, int rows){

        PageHelper.startPage(page, rows);
        PageHelper.orderBy("standard_pur_id asc");
        List<StandardWords> standard_words = standardMapper.getStandard();

        return standard_words;

    }

    /*
     * 删除词条
     */
    public void delStandard(int standardPurId) {

        standardMapper.delStandard(standardPurId);
    }

    /*
     * 编辑词条
     */
    public void editStandard(StandardWords standard_words) {
        standardMapper.editStandard(standard_words);
    }

    /*
     * 添加匹配
     */
    public void addMatch(SAndS s_and_S) {
        standardMapper.addMatch(s_and_S);
    }

    /*
     * 添加词条
     */
    public void addStandard(StandardWords standard_words) {

        standardMapper.addStandard(standard_words);
    }

}
