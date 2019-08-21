package com.whpu.k160345.dao.impl;

import com.whpu.k160345.dao.AdminDao;
import com.whpu.k160345.entity.Admin;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {
    @Override
    public Admin adminLogin(Admin admin) {
        Admin admin1 = getHibernateTemplate().execute(
                new HibernateCallback<Admin>() {
                    @Override
                    public Admin doInHibernate(Session session) throws HibernateException {
                        String sql = "from Admin where account = :account and password = :password";
                        Query query = session.createQuery(sql);
                        query.setParameter("account",admin.getAccount());
                        query.setParameter("password",admin.getPassword());
                        return (Admin)query.uniqueResult();
                    }
                }
        );
        return admin1;
    }

    @Override
    public void updateAdmin(Admin admin) {
        getHibernateTemplate().update(admin);
    }
}
