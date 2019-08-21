package com.whpu.k16035.service.impl;

import com.whpu.k16035.dao.impl.OrdersDaoImpl;
import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.entity.Order;
import com.whpu.k16035.service.OrdersService;

import java.util.List;


//服务层的实现类
public class OrdersServiceImpl implements OrdersService {
    //创建持久层的对象
    private OrdersDaoImpl ordersDao;


    @Override
    public List<Order> getOrdersAllByUserId(int userId) {
        return ordersDao.getOrdersAllByUserId(userId);
    }

    @Override
    public void placeOrders(List<Order> ordersList) {
        ordersDao.placeOrders(ordersList);
    }

    @Override
    public void addSums(Dishe dishes, Integer dishesSum) {
        ordersDao.addSums(dishes, dishesSum);
    }

    @Override
    public List<Order> getOrdersByName(int userId, String dishesName) {
        return ordersDao.getOrdersByName(userId,dishesName);
    }


    public OrdersDaoImpl getOrdersDao() {
        return ordersDao;
    }

    public void setOrdersDao(OrdersDaoImpl ordersDao) {
        this.ordersDao = ordersDao;
    }
}
