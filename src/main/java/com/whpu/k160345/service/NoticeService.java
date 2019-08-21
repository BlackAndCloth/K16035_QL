package com.whpu.k160345.service;

import com.whpu.k160345.entity.Notice;

import java.util.List;

public interface NoticeService {
    public List<Notice> selectNoticeAll(Integer page);

    public Notice selectNoticeById(Integer id);

    public void updateNoticeById(Notice notice);

    public void insertNotice(Notice notice);

    public void deleteNotice(Integer id);

    public Long selectPageSum();
}
