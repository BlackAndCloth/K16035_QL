package com.whpu.k160345.action;

import com.whpu.k160345.entity.Notice;
import com.whpu.k160345.service.NoticeService;

import java.util.Date;
import java.util.List;

public class NoticeAction {
    private NoticeService noticeServiceM;

    private Notice notice;

    private List<Notice> noticeList;

    private Integer id;
    private Long pageSum;
    private Integer page;

    public String selectNoticeAll(){
        if(noticeServiceM.selectPageSum() % 8 == 0){
            pageSum = noticeServiceM.selectPageSum() / 8;
        }else {
            pageSum = (noticeServiceM.selectPageSum() / 8) + 1;
        }
        noticeList = noticeServiceM.selectNoticeAll(page);
        return "list";
    }
    public String selectNoticeById(){
        notice = noticeServiceM.selectNoticeById(id);
        return "updateNotice";
    }

    public String updateNoticeById(){
        notice.setId(id);
        noticeServiceM.updateNoticeById(notice);
        return "requert";
    }

    public String insertNotice(){
        notice.setDateTimes(new Date());
        noticeServiceM.insertNotice(notice);
        return "requert";
    }

    public String deleteNotice(){
        noticeServiceM.deleteNotice(id);
        return "requert";
    }

    public NoticeService getNoticeServiceM() {
        return noticeServiceM;
    }

    public void setNoticeServiceM(NoticeService noticeService) {
        this.noticeServiceM = noticeService;
    }

    public Notice getNotice() {
        return notice;
    }

    public void setNotice(Notice notice) {
        this.notice = notice;
    }

    public List<Notice> getNoticeList() {
        return noticeList;
    }

    public void setNoticeList(List<Notice> noticeList) {
        this.noticeList = noticeList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getPageSum() {
        return pageSum;
    }

    public void setPageSum(Long pageSum) {
        this.pageSum = pageSum;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }
}
