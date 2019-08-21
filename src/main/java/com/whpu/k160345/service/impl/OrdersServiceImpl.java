package com.whpu.k160345.service.impl;

import com.whpu.k160345.dao.OrdersDao;
import com.whpu.k160345.entity.Orders;
import com.whpu.k160345.service.OrdersService;

import java.util.List;
import java.util.Set;

public class OrdersServiceImpl implements OrdersService {
    private OrdersDao ordersDao;
    @Override
    public Long selectPageSum() {
        return ordersDao.selectPageSum();
    }

    @Override
    public List<Orders> selectOrdersAll(Integer page) {
        return ordersDao.selectOrdersAll(page);
    }

    @Override
    public List<Orders> selectOrdersA() {
        return ordersDao.selectOrdersA();
    }

    @Override
    public Set<Orders> searchOrders(Orders order) {
        return ordersDao.searchOrders(order);
    }

    @Override
    public List<Orders> selectOrdersToday(Integer page) {
        return ordersDao.selectOrdersToday(page);
    }

    @Override
    public void updateOrderFlagYes(Integer id) {
        ordersDao.updateOrderFlagYes(id);
    }

    @Override
    public void updateOrderFlagNo(Integer id) {
        ordersDao.updateOrderFlagNo(id);
    }

    @Override
    public Long selectPageSumToday() {
        return ordersDao.selectPageSumToday();
    }

    public OrdersDao getOrdersDao() {
        return ordersDao;
    }

    public void setOrdersDao(OrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }


}
