package com.whpu.k160345.dao.impl;

import com.whpu.k160345.dao.OrdersDao;
import com.whpu.k160345.entity.Dishes;
import com.whpu.k160345.entity.Orders;
import com.whpu.k160345.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.text.SimpleDateFormat;
import java.util.*;

public class OrdersDaoImpl extends HibernateDaoSupport implements OrdersDao {

    @Override
    public Long selectPageSum() {
        return getHibernateTemplate().execute(
                new HibernateCallback<Long>() {
                    @Override
                    public Long doInHibernate(Session session) throws HibernateException {
                        String sql = "select count(*) from Orders";
                        Query query = session.createQuery(sql);
                        return  (Long) query.uniqueResult();
                    }
                }
        );
    }

    @Override
    public List<Orders> selectOrdersAll(Integer page) {
        if(page == null){
            page = 1;
        }
        int begin = (page - 1)*8;
        List<Orders> ordersList = getHibernateTemplate().execute(
                new HibernateCallback<List<Orders>>() {
                    @Override
                    public List<Orders> doInHibernate(Session session) throws HibernateException {
                        String sql = "From Orders";
                        Query query = session.createQuery(sql);
                        query.setFirstResult(begin);
                        query.setMaxResults(8);
                        return query.list();
                    }
                }
        );
        return ordersList;
    }

    @Override
    public List<Orders> selectOrdersA() {
        return (List<Orders>)getHibernateTemplate().find("From Orders");
    }

    @Override
    public Set<Orders> searchOrders(Orders order) {
        Set<Orders> ordersSet = new HashSet<>();
        String userName = order.getUser().getName();
        String disheName = order.getDishes().getName();
        List<User> userList = new ArrayList<>();
        List<Dishes> dishesList = new ArrayList<>();
        List<Orders> ordersList = new ArrayList<>();
        if(userName==null || userName.equals("")) {

        }else {
            userList = getHibernateTemplate().execute(
                    new HibernateCallback<List<User>>() {
                        @Override
                        public List<User> doInHibernate(Session session) throws HibernateException {
                            String sql = "from User where name like :userName";
                            Query query = session.createQuery(sql);
                            query.setParameter("userName", "%" + userName + "%");
                            return query.list();
                        }
                    }
            );
        }
        if(disheName ==null || disheName.equals("")) {

        }else {
            dishesList = getHibernateTemplate().execute(
                    new HibernateCallback<List<Dishes>>() {
                        @Override
                        public List<Dishes> doInHibernate(Session session) throws HibernateException {
                            String sql = "From Dishes where name like :disheName";
                            Query query = session.createQuery(sql);
                            query.setParameter("disheName", "%" + disheName + "%");
                            return query.list();
                        }
                    }
            );
        }
        if(order.getDateTime()!=null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String date = dateFormat.format(order.getDateTime());
            ordersList = getHibernateTemplate().execute(
                    new HibernateCallback<List<Orders>>() {
                        @Override
                        public List<Orders> doInHibernate(Session session) throws HibernateException {
                            String sql = "From Orders where CONVERT(dateTime,CHAR) like :date";
                            Query query = session.createQuery(sql);
                            query.setParameter("date", date+"%");
                            return query.list();
                        }
                    }
            );
        }
        ordersSet.clear();
        if(userList.size()!= 0){
            for(User user : userList){
                ordersSet.addAll(new HashSet<>(user.getOrdersList()));
            }
        }
        if (dishesList.size()!=0 ) {
            if(ordersSet.size()!= 0) {
                for (Dishes dishes : dishesList) {
                    ordersSet.retainAll(new HashSet<>(dishes.getOrdersList()));
                }
            }else {
                for (Dishes dishes : dishesList) {
                    ordersSet.addAll(new HashSet<>(dishes.getOrdersList()));
                }
            }
        }
        if(ordersList.size()!=0){
            if(ordersSet.size()!= 0) {
                ordersSet.retainAll(new HashSet<>(ordersList));
            }else {
                ordersSet.addAll(new HashSet<>(ordersList));
            }
        }
        return ordersSet ;
    }

    @Override
    public List<Orders> selectOrdersToday(Integer page) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String today = dateFormat.format(new Date());
        Integer begin = (page-1)*8;
        List<Orders> ordersList = getHibernateTemplate().execute(
                new HibernateCallback<List<Orders>>() {
                    @Override
                    public List<Orders> doInHibernate(Session session) throws HibernateException {
                        String sql = "FROM Orders WHERE CONVERT(dateTime,CHAR) LIKE :dateTime";
                        Query query = session.createQuery(sql);
                        query.setParameter("dateTime",today+"%");
                        query.setFirstResult(begin);
                        query.setMaxResults(8);
                        return query.list();
                    }
                }
        );
        return ordersList;
    }

    @Override
    public void updateOrderFlagYes(Integer id) {
        Orders orders = getHibernateTemplate().get(Orders.class,id);
        orders.setDelivery("1");
        getHibernateTemplate().update(orders);
    }

    @Override
    public void updateOrderFlagNo(Integer id) {
        Orders orders = getHibernateTemplate().get(Orders.class,id);
        orders.setDelivery("2");
        getHibernateTemplate().update(orders);
    }

    @Override
    public Long selectPageSumToday() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String today = dateFormat.format(new Date());
        return getHibernateTemplate().execute(
                new HibernateCallback<Long>() {
                    @Override
                    public Long doInHibernate(Session session) throws HibernateException {
                        String sql = "select count(*) FROM Orders WHERE CONVERT(dateTime,CHAR) LIKE :dateTime";
                        Query query = session.createQuery(sql);
                        query.setParameter("dateTime",today+"%");
                        return  (Long) query.uniqueResult();
                    }
                }
        );
    }
}
