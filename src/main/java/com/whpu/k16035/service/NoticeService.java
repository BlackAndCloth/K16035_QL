package com.whpu.k16035.service;



//服务层

import com.whpu.k16035.entity.Notice;

import java.util.List;

public interface NoticeService {
    List<Notice> selectNoticeAll();
    List<Notice> selectNoticeEight();

    Notice showNotice(Integer noticeId);

}
