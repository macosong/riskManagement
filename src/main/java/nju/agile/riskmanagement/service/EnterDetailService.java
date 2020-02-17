package nju.agile.riskmanagement.service;

import nju.agile.riskmanagement.mapper.EnterDetailMapper;
import nju.agile.riskmanagement.pojo.EnterLog;
import nju.agile.riskmanagement.pojo.EnterpriseInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * EnterDetailService
 *
 * @author: songqiang
 * @date: 2020/2/16
 */
@Service
@Transactional
public class EnterDetailService {
    @Autowired
    EnterDetailMapper enterDetailMapper;


    public EnterpriseInfo showEnterDetail(int taxPayerId) {
        EnterpriseInfo enterprise_info;

        enterprise_info = enterDetailMapper.showEnterDetail(taxPayerId);

        return enterprise_info;
    }

    public void editEnterDetail(EnterpriseInfo enterprise_info) {

        enterDetailMapper.editEnterDetail(enterprise_info);

        EnterLog enter_log = new EnterLog();

        int id = enterprise_info.getTaxPayerId();
        String pass = enterprise_info.getEnterLog().getEnterLogPass();

        enter_log.setTaxPayerId(id);
        enter_log.setEnterLogPass(pass);

        enterDetailMapper.editEnterPass(enter_log);

    }

    public void enterRegister(EnterpriseInfo enterprise_info) {

        enterDetailMapper.enterRegister(enterprise_info);

        EnterLog enter_log = new EnterLog();

        int id = enterprise_info.getTaxPayerId();
        String pass = enterprise_info.getEnterLog().getEnterLogPass();

        enter_log.setTaxPayerId(id);
        enter_log.setEnterLogPass(pass);

        enterDetailMapper.enterRe(enter_log);

    }



}
