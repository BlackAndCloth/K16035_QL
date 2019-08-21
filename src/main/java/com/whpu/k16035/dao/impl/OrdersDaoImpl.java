package com.whpu.k16035.dao.impl;


//持久层

import com.whpu.k16035.dao.OrdersDao;
import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.entity.Order;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class OrdersDaoImpl extends HibernateDaoSupport implements OrdersDao {

    @Override
    public List<Order> getOrdersAllByUserId(int userId) {

        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("from Order where userId = :userId");
        query.setParameter("userId" , userId);
        List<Order> ordersList = query.list();
        session.close();



        return ordersList;

    }

    @Override
    public void placeOrders(List<Order> ordersList) {
        Session session = this.getSessionFactory().openSession();
        for (Order orders : ordersList) {
            session.save(orders);
        }
        session.close();
    }

    @Override
    public void addSums(Dishe dishes, Integer dishesSum) {
        //获取数据库中菜品的销量

        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("select sums from Dishe where id=:id");
        query.setParameter("id" , dishes.getId());
        Integer sum = Integer.parseInt((String) query.uniqueResult());
        sum = sum + dishesSum;
        dishes.setSums(String.valueOf(sum));
        this.getHibernateTemplate().update(dishes);
    }

    @Override
    public List<Order> getOrdersByName(int userId, String dishesName) {
       Session session = this.getSessionFactory().openSession();
//       Query query = session.createQuery("from Orders o,Dishes d where d.id=o.oderDishes.id and d.name like :dishesName and o.orderUser.id=:userId");
       Query query = session.createQuery("from Order where orderUser.id=:userId and oderDishes.name like :dishesName");
       query.setParameter("userId", userId);
       query.setParameter("dishesName", "%" + dishesName + "%");
       List<Order> ordersList = query.list();
       session.close();
       return ordersList;
    }

}
