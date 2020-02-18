package nju.agile.riskmanagement.service;

import nju.agile.riskmanagement.mapper.EnterLogMapper;
import nju.agile.riskmanagement.pojo.EnterLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EnterLogService {
    @Autowired
    EnterLogMapper enterLogMapper;

    //查看是否存在
    public int checkExists(int taxPayerId) {
        int re =0;

        re=enterLogMapper.checkExists(taxPayerId);

        return re;
    }

    //获取登录信息
    public EnterLog checkLog(int taxPayerId) {

        EnterLog enter_log;

        enter_log=enterLogMapper.checkLog(taxPayerId);

        return enter_log;

    }
}
