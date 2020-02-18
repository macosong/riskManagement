package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.NotMatchInfo;
import nju.agile.riskmanagement.service.UnmatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UnmatchController {

    @Autowired
    UnmatchService unmatchService;


    /*
     * 显示不匹配企业名单
     */
    @RequestMapping("view_unmatch_enter.action")
    @ResponseBody
    public PageInfo<NotMatchInfo> viewUnmatchEnter(@RequestParam(required=false,defaultValue="1") int page,
                                                   @RequestParam(required=false,defaultValue="1") int rows, HttpServletRequest request){

        List<NotMatchInfo> not_match_infos = new ArrayList<>();

        not_match_infos = unmatchService.getAllUnmatch(page, rows);

        PageInfo<NotMatchInfo> pageInfo = new PageInfo<>(not_match_infos);

        return pageInfo;

    }

    /*
     * 风险核实
     */
    @RequestMapping("unmatch_check.action")
    public String checkUnmatchResult(NotMatchInfo not_match_info ) {

        unmatchService.checkUnmatchResult(not_match_info);

        return "redirect:view_unmatch";
    }
}
