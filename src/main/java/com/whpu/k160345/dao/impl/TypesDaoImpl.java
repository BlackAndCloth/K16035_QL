package com.whpu.k160345.dao.impl;

import com.whpu.k160345.dao.TypesDao;
import com.whpu.k160345.entity.Types;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class TypesDaoImpl extends HibernateDaoSupport implements TypesDao {
    @Override
    public List<Types> selectTypesAll(Integer page) {
        List<Types> typesList = getHibernateTemplate().execute(
                new HibernateCallback<List<Types>>() {
                    @Override
                    public List<Types> doInHibernate(Session session) throws HibernateException {
                        String sql = "from Types";
                        Query query = session.createQuery(sql);
                        int begin = (page - 1)*8;
                        query.setFirstResult(begin);
                        query.setMaxResults(8);
                        return query.list();
                    }
                }
        );
        return typesList;
    }

    @Override
    public void updateTypeById(Integer id) {
        Types types = new Types();
        types.setId(id);
        getHibernateTemplate().update(types);
    }

    @Override
    public Types selectTypeById(Integer id) {
        return getHibernateTemplate().get(Types.class,id);
    }

    @Override
    public void deleteTypeById(Integer id) {
        Types types = new Types();
        types.setId(id);
        getHibernateTemplate().delete(types);
    }

    @Override
    public void insertTypeById(Types types) {
        getHibernateTemplate().save(types);
    }

    @Override
    public Long selectPageSum() {
        return getHibernateTemplate().execute(
                new HibernateCallback<Long>() {
                    @Override
                    public Long doInHibernate(Session session) throws HibernateException {
                        String sql = "select count(*) from Types";
                        Query query = session.createQuery(sql);
                        return  (Long) query.uniqueResult();
                    }
                }
        );
    }
}
