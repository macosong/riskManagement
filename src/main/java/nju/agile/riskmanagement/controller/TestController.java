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
    @RequestMapping("/login")
    public String hello(){
        return "login";
    }
}
