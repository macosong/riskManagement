package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.SAndS;
import nju.agile.riskmanagement.pojo.StandardWords;
import nju.agile.riskmanagement.service.StandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * StandardController
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Controller
public class StandardController {

    @Autowired
    StandardService standardService;

    /*
     * 显示所有词条
     */
    @RequestMapping("view_standard.action")
    @ResponseBody
    public PageInfo<StandardWords> viewStandard(@RequestParam(required=false,defaultValue="1") int page,
                                                @RequestParam(required=false,defaultValue="2") int rows, HttpServletRequest request){

        List<StandardWords> standard_words = new ArrayList<>();

        standard_words = standardService.getStandard(page, rows);

        PageInfo<StandardWords> standardInfo = new PageInfo<>(standard_words);

        return standardInfo;

    }

    /*
     * 删除词条
     */
    @RequestMapping("delStandard.action")
    public String delStandard(int standardPurId) {

        standardService.delStandard(standardPurId);

        return "redirect:view_standard.jsp";
    }

    /*
     * 编辑词条
     */
    @RequestMapping("edit_standard.action")
    public String editStandard(StandardWords standard_words) {

        standardService.editStandard(standard_words);

        return "redirect:view_standard.jsp";

    }
    /*
     * 添加匹配
     */
    @RequestMapping("add_match.action")
    public String addMatch(SAndS s_and_S) {

        standardService.addMatch(s_and_S);

        return "redirect:view_standard.jsp";

    }
    /*
     * 添加词条
     */
    @RequestMapping("add_standard.action")
    public String addStandard(StandardWords standard_words) {

        standardService.addStandard(standard_words);

        return "redirect:view_standard.jsp";
    }

}
