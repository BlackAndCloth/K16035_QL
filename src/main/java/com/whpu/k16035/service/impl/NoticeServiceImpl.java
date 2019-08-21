package com.whpu.k16035.service.impl;

import com.whpu.k16035.dao.impl.NoticeDaoImpl;
import com.whpu.k16035.entity.Notice;
import com.whpu.k16035.service.NoticeService;

import java.util.List;


//服务层的实现类
public class NoticeServiceImpl implements NoticeService {
    //创建持久层的对象
    private NoticeDaoImpl noticeDao;

    @Override
    public List<Notice> selectNoticeAll() {
        return noticeDao.selectNoticeAll();
    }

    @Override
    public List<Notice> selectNoticeEight() {
        return noticeDao.selectNoticeEight();
    }

    @Override
    public Notice showNotice(Integer noticeId) {
        return noticeDao.showNotice(noticeId);
    }


    //======================================================


    public NoticeDaoImpl getNoticeDao() {
        return noticeDao;
    }

    public void setNoticeDao(NoticeDaoImpl noticeDao) {
        this.noticeDao = noticeDao;
    }



}
