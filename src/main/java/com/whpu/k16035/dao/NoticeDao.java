package com.whpu.k16035.dao;

/*
持久层的接口

 */

import com.whpu.k16035.entity.Notice;

import java.util.List;

public interface NoticeDao {
    //增删改查
    //查询全部
    List<Notice> selectNoticeAll();
    List<Notice> selectNoticeEight();

    Notice showNotice(Integer noticeId);
}
