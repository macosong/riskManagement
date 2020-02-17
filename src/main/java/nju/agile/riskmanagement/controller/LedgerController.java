package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.LedgerIn;
import nju.agile.riskmanagement.pojo.LedgerOut;
import nju.agile.riskmanagement.service.LedgerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * LedgerController
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Controller
public class LedgerController {
    @Autowired
    LedgerService ledgerService;

    /*
     * 显示购货台账
     */
    @RequestMapping("view_buy.action")
    @ResponseBody
    public PageInfo<LedgerIn> showBuy(@RequestParam(required=false,defaultValue="1") int page,
                                      @RequestParam(required=false,defaultValue="2") int rows, HttpServletRequest request){

        int id = (int) request.getSession().getAttribute("enter_ID");

        List<LedgerIn> ledger_ins = new ArrayList<>();

        ledger_ins =ledgerService.getBuy(page, rows,id);

        PageInfo<LedgerIn> pageInfo = new PageInfo<>(ledger_ins);

        return pageInfo;

    }


    /*
     * 显示售货台账
     */
    @RequestMapping("view_pur.action")
    @ResponseBody
    public PageInfo<LedgerOut> showPur(@RequestParam(required=false,defaultValue="1") int page,
                                          @RequestParam(required=false,defaultValue="2") int rows, HttpServletRequest request){

        int id = (int) request.getSession().getAttribute("enter_ID");

        List<LedgerOut> ledger_outs = new ArrayList<>();

        ledger_outs =ledgerService.getPur(page, rows,id);

        PageInfo<LedgerOut> pageInfo = new PageInfo<>(ledger_outs);

        return pageInfo;

    }

    /*
     * 季度查账
     */
    @RequestMapping("checkAllAccount.action")
    public String checkAllAccount() {
        ledgerService.checkAllAccount();

        return "redirect:view_unmatch.jsp";
    }

}
