package nju.agile.riskmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * ControllerHelper
 *
 * @author: songqiang
 * @date: 2020/2/18
 */
@Controller
public class ControllerHelper {
    @RequestMapping("/admin_index")
    public String admin_index(){ return "admin_index"; }

    @RequestMapping("/a_view_blacklist")
    public String a_view_blacklist() { return "a_view_blacklist";}

    @RequestMapping("/view_standard")
    public String view_standard() { return "view_standard";}

    @RequestMapping("/view_simulation")
    public String view_simulation() { return "view_simulation";}

    @RequestMapping("/view_unmatch")
    public String view_unmatch() { return "view_unmatch"; }

    @RequestMapping("/view_false_enter")
    public String view_false_enter() { return "view_false_enter"; }

    @RequestMapping("/view_false_team")
    public String view_false_team() { return "view_false_team"; }

    @RequestMapping("/add_admin")
    public String add_admin() { return "add_admin"; }

    //
    @RequestMapping("/enter_index")
    public String enter_index() { return "enter_index"; }

    @RequestMapping("/up_invoice")
    public String up_invoice() { return "up_invoice"; }

    @RequestMapping("/view_invoice")
    public String view_invoice() { return "view_invoice"; }

    @RequestMapping("/view_buy")
    public String view_buy() { return "view_buy"; }

    @RequestMapping("/view_pur")
    public String view_pur() { return "view_pur"; }

    @RequestMapping("/view_blacklist")
    public String view_blacklist() { return "view_blacklist";}

    //window.location.href
    @RequestMapping("/register")
    public String register() { return "register"; }

    @RequestMapping("/login")
    public String login() { return "login"; }

    //layer content
    @RequestMapping("/modify_enter_info")
    public String modify_enter_info() { return "modify_enter_info"; }

    @RequestMapping("/false_pur")
    public String false_pur() { return "false_pur"; }

    @RequestMapping("/false_team_detail")
    public String false_team_detail() {return "false_team_detail";}

    @RequestMapping("/add_simulation")
    public String add_simulation() { return "add_simulation";}

    @RequestMapping("/edit_simulation")
    public String edit_simulation() { return "edit_simulation"; }

    @RequestMapping("/add_standard")
    public String add_standard() { return "add_standard";}

    @RequestMapping("/edit_standard")
    public String edit_standard() { return "edit_standard";}

    @RequestMapping("/add_match")
    public String add_match() { return "add_match";}

    @RequestMapping("/check_unmatch")
    public String check_unmatch() { return "check_unmatch";}

    @RequestMapping("/unmatch_details")
    public String unmatch_details() { return "unmatch_details";}


}
