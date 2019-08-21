package com.whpu.k160345.dao;

import com.whpu.k160345.entity.Orders;

import java.util.List;
import java.util.Set;

public interface OrdersDao {
    public Long selectPageSum();

    public List<Orders> selectOrdersAll(Integer page);

    public List<Orders> selectOrdersA();

    public Set<Orders> searchOrders(Orders order);

    public List<Orders> selectOrdersToday(Integer page);

    public void updateOrderFlagYes(Integer id);

    public void updateOrderFlagNo(Integer id);

    public Long selectPageSumToday();
}
