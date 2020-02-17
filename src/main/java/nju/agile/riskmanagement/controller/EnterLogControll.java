package nju.agile.riskmanagement.controller;

import nju.agile.riskmanagement.pojo.EnterLog;
import nju.agile.riskmanagement.service.EnterLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * EnterLogControll
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Controller
public class EnterLogControll {
    @Autowired
    EnterLogService enterLogService;

    /*
     * 企业用户登录
     */
    @RequestMapping("enter_log.action")

    public String enterLog(EnterLog enter_log, HttpServletRequest req, Model model) {

        //登录ID和密码
        int taxPayerId = enter_log.getTaxPayerId();
        String logPass = enter_log.getEnterLogPass();

        int re = enterLogService.checkExists(taxPayerId);

        if(re==0) {
            model.addAttribute("msg", "ID不正确");
            return "login";
        }

        EnterLog enter_log2 = enterLogService.checkLog(taxPayerId);

        if(!enter_log2.getEnterLogPass().equals(logPass)) {
            model.addAttribute("msg", "ID或密码不正确");
            return "login";
        }

        req.getSession().setAttribute("enter_ID", taxPayerId);
        return "redirect:enter_index.jsp";

    }
}
