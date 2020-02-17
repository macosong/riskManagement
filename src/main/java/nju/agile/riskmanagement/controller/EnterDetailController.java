package nju.agile.riskmanagement.controller;

import nju.agile.riskmanagement.pojo.EnterpriseInfo;
import nju.agile.riskmanagement.service.EnterDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * EnterDetailController
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Controller
public class EnterDetailController {
    @Autowired
    EnterDetailService enterDetailService;

    /*
     * 显示详细信息
     */
    @RequestMapping("show_enter_detail.action")
    @ResponseBody
    public EnterpriseInfo shwoEnterInfo(HttpServletRequest request) {
        EnterpriseInfo enterprise_info;
        int taxPayerId = (int) request.getSession().getAttribute("enter_ID");
        System.out.println(taxPayerId);
        enterprise_info = enterDetailService.showEnterDetail(taxPayerId);

        return enterprise_info;

    }
    /*
     * 修改企业信息
     */
    @RequestMapping("enter_info_modify.action")
    public String enterInfoModify(EnterpriseInfo enterprise_info) {

        enterDetailService.editEnterDetail(enterprise_info);

        return "redirect:enter_index.jsp";
    }

    /*
     * 企业注册
     *
     */
    @RequestMapping("enter_register.action")

    public String enterRegister(EnterpriseInfo enterprise_info) {

        enterDetailService.enterRegister(enterprise_info);

        return "redirect:login.jsp";
    }
}
