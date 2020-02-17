package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.MatchDetail;
import nju.agile.riskmanagement.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * MatchController
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Controller
public class MatchController {
    @Autowired
    MatchService matchService;

    //列表
    @RequestMapping("view_match_detail.action")
    @ResponseBody
    public PageInfo<MatchDetail> getMatchDetail(@RequestParam(required=false,defaultValue="1") int page,
                                                @RequestParam(required=false,defaultValue="2") int rows, HttpServletRequest request){

        List<MatchDetail> match_details = new ArrayList<>();

        match_details = matchService.getMatchDetail(page, rows);

        PageInfo<MatchDetail> pageInfo = new PageInfo<>(match_details);

        return pageInfo;
    }

    //审查
    @RequestMapping("check_word.action")
    public String checkWords(MatchDetail match_detail) {

        matchService.checkWords(match_detail);

        return "redirect:admin_index.jsp";
    }
}
