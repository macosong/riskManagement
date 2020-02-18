package nju.agile.riskmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TestController
 *
 * @author: songqiang
 * @date: 2020/2/17
 */
@Controller
public class TestController {
    @RequestMapping("/test")
    public String hello(){
        return "admin_index";
    }

//    @RequestMapping("/admin_index")
//    public String test() { return "admin_index"; }
}
