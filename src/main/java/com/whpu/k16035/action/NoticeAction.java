package com.whpu.k16035.action;

import com.whpu.k16035.entity.Notice;
import com.whpu.k16035.service.impl.NoticeServiceImpl;

import java.util.List;


//控制层：处理请求
public class NoticeAction {
    //数据
    private List<Notice> noticeList;
    private Integer noticeId;
    private Notice notice;
    //服务层
    private NoticeServiceImpl noticeService;

    //查询全部
    public String selectNoticeAll(){
        //调用服务层的方法
        noticeList = noticeService.selectNoticeAll();
        return "showNoticeAll";
    }

    //查询前8
    public String selectNoticeEight(){
        //调用服务层的方法
        noticeList = noticeService.selectNoticeEight();
        return "list";
    }
    //查询单条
    public String showNotice(){
        notice = noticeService.showNotice(noticeId);
        return "showNotice";
    }

    //查询单条
    public String showNoticeOfList(){
        notice = noticeService.showNotice(noticeId);
        System.out.println("notice = " + notice);
        return "showNoticeOfList";
    }









    public List<Notice> getNoticeList() {
        return noticeList;
    }

    public void setNoticeList(List<Notice> noticeList) {
        this.noticeList = noticeList;
    }

    public NoticeServiceImpl getNoticeService() {
        return noticeService;
    }

    public void setNoticeService(NoticeServiceImpl noticeService) {
        this.noticeService = noticeService;
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public Notice getNotice() {
        return notice;
    }

    public void setNotice(Notice notice) {
        this.notice = notice;
    }
}
