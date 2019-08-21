package com.whpu.k16035.dao.impl;


//持久层

import com.whpu.k16035.dao.DishesDao;
import com.whpu.k16035.entity.Dishe;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class DishesDaoImpl extends HibernateDaoSupport implements DishesDao {

    //查询全部
    @Override
    public List<Dishe> selectDishesAll() {
        return (List<Dishe>)this.getHibernateTemplate().find("From Dishe");
    }
    @Override
    public List<Dishe> selectDishesByPage(Integer page) {

                //利用HibernateTemplate.execute()方法，以回调方式使用,不需要关闭session
                Session session = this.getSessionFactory().openSession();
                Query query = session.createQuery("from Dishe");
                int begin = (page - 1) * 6;
                query.setFirstResult(begin);
                query.setMaxResults(6);
                List<Dishe> dishesList = query.list();
                session.close();



        return dishesList;
    }

    @Override
    public Integer getPageSum() {
        List<Dishe> dishesList = (List<Dishe>)this.getHibernateTemplate().find("From Dishe");
        if (dishesList.size() % 6 == 0){
            return dishesList.size() / 6;
        }else {
            return dishesList.size() / 6 + 1;
        }
    }

    @Override
    public List<Dishe> getDishesRanking() {
        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("from Dishe order by sums desc");
        query.setFirstResult(0);
        query.setMaxResults(7);
        List<Dishe> list = query.list();
        session.close();
        return list;
    }

    @Override
    public Dishe selectDishesById(Integer dishesId) {
        return this.getHibernateTemplate().get(Dishe.class , dishesId);
    }
}
