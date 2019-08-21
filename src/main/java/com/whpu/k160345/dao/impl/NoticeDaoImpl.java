package com.whpu.k160345.dao.impl;

import com.whpu.k160345.dao.NoticeDao;
import com.whpu.k160345.entity.Notice;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {
    @Override
    public List<Notice> selectNoticeAll(Integer page) {
        List<Notice> noticeList = getHibernateTemplate().execute(
                new HibernateCallback<List<Notice>>() {
                    @Override
                    public List<Notice> doInHibernate(Session session) throws HibernateException {
                        String sql = "from Notice";
                        Query query = session.createQuery(sql);
                        int begin = (page - 1)*8;
                        query.setFirstResult(begin);
                        query.setMaxResults(8);
                        return query.list();
                    }
                }
        );
        return noticeList;
    }

    @Override
    public Notice selectNoticeById(Integer id) {
        return getHibernateTemplate().get(Notice.class,id);
    }

    @Override
    public void updateNoticeById(Notice notice) {
        getHibernateTemplate().update(notice);
    }

    @Override
    public void insertNotice(Notice notice) {
        getHibernateTemplate().save(notice);
    }

    @Override
    public void deleteNotice(Integer id) {
        Notice notice = new Notice();
        notice.setId(id);
        getHibernateTemplate().delete(notice);
    }

    @Override
    public Long selectPageSum() {
        return getHibernateTemplate().execute(
                new HibernateCallback<Long>() {
                    @Override
                    public Long doInHibernate(Session session) throws HibernateException {
                        String sql = "select count(*) from Notice";
                        Query query = session.createQuery(sql);
                        return  (Long) query.uniqueResult();
                    }
                }
        );
    }
}
