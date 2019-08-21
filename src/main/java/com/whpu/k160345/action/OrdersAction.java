package com.whpu.k160345.action;

import com.whpu.k160345.entity.Dishes;
import com.whpu.k160345.entity.Orders;
import com.whpu.k160345.entity.User;
import com.whpu.k160345.service.OrdersService;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class OrdersAction {
    private OrdersService ordersServiceM;
    private Orders order;
    private List<Orders> ordersList;
    private Set<Orders> ordersSet;
    private Long pageSum;
    private Integer page;
    private String userName;
    private String disheName;
    private Integer id;
    private String dateTime;
    public String selectOrdersAll(){
        if(ordersServiceM.selectPageSum() % 8 ==0){
            pageSum = ordersServiceM.selectPageSum() / 8;
        }else {
            pageSum = (ordersServiceM.selectPageSum() / 8) + 1;
        }
        ordersList = ordersServiceM.selectOrdersAll(page);
        return "list";
    }
    public String selectOrdersPage(){
        if(ordersServiceM.selectPageSum() % 8 ==0){
            pageSum = ordersServiceM.selectPageSum() / 8;
        }else {
            pageSum = (ordersServiceM.selectPageSum() / 8) + 1;
        }
        ordersList = ordersServiceM.selectOrdersAll(page);
        return "selectPage";
    }
    public String searchOrders(){
        if(userName != "" ||  disheName != "" || order.getDateTime() != null) {
            User user = new User();
            user.setName(userName);
            order.setUser(user);
            Dishes dishes = new Dishes();
            dishes.setName(disheName);
            order.setDishes(dishes);
            ordersList = new ArrayList<>(ordersServiceM.searchOrders(order));
            return "searchList";
        }else {
            return "goToSelectPage";
        }
    }
    public String selectOrdersToday(){
        pageSum = (ordersServiceM.selectPageSumToday()%8==0)?(ordersServiceM.selectPageSumToday()/8):(ordersServiceM.selectPageSumToday()/8 + 1);
        ordersList = ordersServiceM.selectOrdersToday(page);
        return "todayList";
    }
    public String updateOrderFlagYes(){
        ordersServiceM.updateOrderFlagYes(id);
        return "requert";
    }
    public String updateOrderFlagNo(){
        ordersServiceM.updateOrderFlagNo(id);
        return "requert";
    }
    public OrdersService getOrdersServiceM() {
        return ordersServiceM;
    }

    public void setOrdersServiceM(OrdersService ordersService) {
        this.ordersServiceM = ordersService;
    }

    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    public Long getPageSum() {
        return pageSum;
    }

    public void setPageSum(Long pageSum) {
        this.pageSum = pageSum;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Set<Orders> getOrdersSet() {
        return ordersSet;
    }

    public void setOrdersSet(Set<Orders> ordersSet) {
        this.ordersSet = ordersSet;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDisheName() {
        return disheName;
    }

    public void setDisheName(String disheName) {
        this.disheName = disheName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
}
