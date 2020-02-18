package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.BlackList;
import nju.agile.riskmanagement.service.BlackListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BlackListController {
    @Autowired
    BlackListService blackListService;


    @RequestMapping("view_black_list.action")
    @ResponseBody
    public PageInfo<BlackList> viewBlackList(@RequestParam(required=false,defaultValue="1") int page,
                                             @RequestParam(required=false,defaultValue="1") int rows, HttpServletRequest request){


        List<BlackList> black_lists = new ArrayList<BlackList>();


        black_lists = blackListService.getBlack(page, rows);

        PageInfo<BlackList> bListInfo = new PageInfo<BlackList>(black_lists);

        return bListInfo;
    }
}
