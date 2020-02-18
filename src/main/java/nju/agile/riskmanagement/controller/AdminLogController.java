package nju.agile.riskmanagement.controller;

import nju.agile.riskmanagement.pojo.AdminInfo;
import nju.agile.riskmanagement.service.AdminLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminLogController {
    @Autowired
    AdminLogService adminLogService;

    //登录
    @RequestMapping("admin_log.action")
    public String adminLog(AdminInfo admin_info, HttpServletRequest req, Model model) {

        String adminName = admin_info.getAdminName();
        String adminPass = admin_info.getAdminPass();

        int result = adminLogService.checkExists(adminName);

        if(result==0) {
            model.addAttribute("msg", "姓名不正确");
            return "login";
        }
        AdminInfo admin_info2 = adminLogService.checkLog(adminName);


        if(!admin_info2.getAdminPass().equals(adminPass)) {
            model.addAttribute("msg", "姓名或密码不正确");
            return "login";
        }

        req.getSession().setAttribute("admin_ID", admin_info2.getAdminId());
        return "redirect:admin_index";


    }

    //添加管理员
    @RequestMapping("add_admin.action")
    public String addAdmin(AdminInfo admin_info) {

        adminLogService.addAdmin(admin_info);
        return "redirect:add_admin";
    }
}
