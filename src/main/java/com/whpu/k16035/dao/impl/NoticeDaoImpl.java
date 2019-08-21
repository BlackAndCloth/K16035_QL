package com.whpu.k16035.dao.impl;


//持久层

import com.whpu.k16035.dao.NoticeDao;
import com.whpu.k16035.entity.Notice;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {

    //查询全部
    @Override
    public List<Notice> selectNoticeAll() {
        return (List<Notice>)this.getHibernateTemplate().find("From Notice");
    }

    @Override
    public List<Notice> selectNoticeEight() {

        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("from Notice order by dateTimes desc");
        query.setFirstResult(0);
        query.setMaxResults(2);
        List<Notice> noticeList = query.list();
        session.close();

        return noticeList;
    }

    @Override
    public Notice showNotice(Integer noticeId) {

        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("from Notice where id = :id");
        query.setParameter("id" , noticeId);
        List<Notice> noticeList = query.list();
        session.close();

        return noticeList.get(0);
    }
}
