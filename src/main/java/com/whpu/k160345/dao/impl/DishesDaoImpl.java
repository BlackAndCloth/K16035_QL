package com.whpu.k160345.dao.impl;

import com.whpu.k160345.dao.DishesDao;
import com.whpu.k160345.entity.Dishes;
import com.whpu.k160345.entity.Types;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class DishesDaoImpl extends HibernateDaoSupport implements DishesDao {
   @Override
   public List<Dishes> selectDishesAll(Integer page) {
       List<Dishes> dishesList = getHibernateTemplate().execute(
               new HibernateCallback<List<Dishes>>() {
                   @Override
                   public List<Dishes> doInHibernate(Session session) throws HibernateException {
                       String sql = "from Dishes";
                       Query query = session.createQuery(sql);
                       int begin = (page - 1)*8;
                       query.setFirstResult(begin);
                       query.setMaxResults(8);
                       return query.list();
                   }
               }
       );
       return dishesList;
   }

   @Override
   public void insertDishes(Dishes dishes) {
      getHibernateTemplate().save(dishes);
   }

   @Override
   public Dishes selectDishesById(Integer id) {
      return getHibernateTemplate().get(Dishes.class,id);
   }

    @Override
    public void updateDishes(Dishes dishes) {
        getHibernateTemplate().update(dishes);
    }

    @Override
    public void deleteDishesById(Integer id) {
       Dishes dishes = new Dishes();
       dishes.setId(id);
       getHibernateTemplate().delete(dishes);
    }

    @Override
    public Long selectPageSum() {
        return getHibernateTemplate().execute(
                new HibernateCallback<Long>() {
                    @Override
                    public Long doInHibernate(Session session) throws HibernateException {
                        String sql = "select count(*) from Dishes";
                        Query query = session.createQuery(sql);
                        return  (Long) query.uniqueResult();
                    }
                }
        );
    }

    @Override
    public List<Types> selectTypeList() {
        return (List<Types> )getHibernateTemplate().find("FROM Types");
    }
}
