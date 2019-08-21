package com.whpu.k160345.service.impl;

import com.whpu.k160345.dao.NoticeDao;
import com.whpu.k160345.entity.Notice;
import com.whpu.k160345.service.NoticeService;

import java.util.List;

public class NoticeServiceImpl implements NoticeService {
    private NoticeDao noticeDao;
    @Override
    public List<Notice> selectNoticeAll(Integer page) {
        return noticeDao.selectNoticeAll(page);
    }

    @Override
    public Notice selectNoticeById(Integer id) {
        return noticeDao.selectNoticeById(id);
    }

    @Override
    public void updateNoticeById(Notice notice) {
        noticeDao.updateNoticeById(notice);
    }

    @Override
    public void insertNotice(Notice notice) {
        noticeDao.insertNotice(notice);
    }

    @Override
    public void deleteNotice(Integer id) {
        noticeDao.deleteNotice(id);
    }

    @Override
    public Long selectPageSum() {
        return noticeDao.selectPageSum();
    }

    public NoticeDao getNoticeDao() {
        return noticeDao;
    }

    public void setNoticeDao(NoticeDao noticeDao) {
        this.noticeDao = noticeDao;
    }


}
