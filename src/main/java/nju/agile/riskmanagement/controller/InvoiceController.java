package nju.agile.riskmanagement.controller;

import com.github.pagehelper.PageInfo;
import nju.agile.riskmanagement.pojo.InvoiceDetails;
import nju.agile.riskmanagement.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class InvoiceController {
    @Autowired
    InvoiceService invoiceService;

    /*
     * 上传发票
     */
    @RequestMapping("up_invoice.action")
    public String uploadInvoice(InvoiceDetails invoice_details) {

        invoiceService.upInvoice(invoice_details);
        /*
         * 写方法匹配！！！！！匹配项大于一的加入匹配表去审查！！！！
         * 匹配一项的直接加入到台账中
         */
        invoiceService.match(invoice_details);

        return "redirect:up_invoice";
    }

    /*
     * 显示发票列表
     */
    @RequestMapping("view_invoice.action")
    @ResponseBody
    public PageInfo<InvoiceDetails> viewInvoice(@RequestParam(required=false,defaultValue="1") int page,
                                                @RequestParam(required=false,defaultValue="2") int rows, HttpServletRequest request){

        List<InvoiceDetails> inList = new ArrayList<>();

        int taxPayerId = (int) request.getSession().getAttribute("enter_ID");

        inList = invoiceService.getInvoice(taxPayerId, page, rows);

        PageInfo<InvoiceDetails> inPageInfo = new PageInfo<>(inList);

        return inPageInfo;

    }

}
