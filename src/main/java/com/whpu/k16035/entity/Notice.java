package com.whpu.k16035.entity;

import java.sql.Date;

public class Notice {
    //创建与表对应的属性
    private Integer id;
    private String title;
    private String content;
    private Date dateTimes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateTimes() {
        return dateTimes;
    }

    public void setDateTimes(Date dateTimes) {
        this.dateTimes = dateTimes;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", dateTimes=" + dateTimes +
                '}';
    }
}
