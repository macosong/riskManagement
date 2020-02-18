package nju.agile.riskmanagement.service;

import nju.agile.riskmanagement.mapper.AdminLogMapper;
import nju.agile.riskmanagement.pojo.AdminInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminLogService {
    @Autowired
    AdminLogMapper adminLogMapper;

    public int checkExists(String adminName) {

        int re = 0;
        re = adminLogMapper.checkExists(adminName);

        return re;

    }

    public AdminInfo checkLog(String adminName) {
        AdminInfo admin_info;
        admin_info = adminLogMapper.checkLog(adminName);
        return admin_info;
    }

    public void addAdmin(AdminInfo admin_info) {
        adminLogMapper.addAdmin(admin_info);
    }

}
