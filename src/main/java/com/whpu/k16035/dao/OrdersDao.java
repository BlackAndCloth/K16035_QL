package com.whpu.k16035.dao;

/*
持久层的接口

 */

import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.entity.Order;

import java.util.List;

public interface OrdersDao {
    List<Order> getOrdersAllByUserId(int userId);

    void placeOrders(List<Order> ordersList);

    void addSums(Dishe dishes, Integer dishesSum);

    List<Order> getOrdersByName(int userId, String dishesName);
}
