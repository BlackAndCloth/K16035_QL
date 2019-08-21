package com.whpu.k16035.entity;

import java.util.Date;

public class Order {
    //创建与表对应的属性
    private Integer id;
    //下单者
    private Users orderUser;
    //对应菜品
    private Dishe oderDishes;
    //订购数量
    private Integer dishesSum;
    //订单时间
    private Date dateTime;
    //订单状态
    private Integer delivery;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Users getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(Users orderUser) {
        this.orderUser = orderUser;
    }

    public Dishe getOderDishes() {
        return oderDishes;
    }

    public void setOderDishes(Dishe oderDishes) {
        this.oderDishes = oderDishes;
    }

    public Integer getDishesSum() {
        return dishesSum;
    }

    public void setDishesSum(Integer dishesSum) {
        this.dishesSum = dishesSum;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Integer getDelivery() {
        return delivery;
    }

    public void setDelivery(Integer delivery) {
        this.delivery = delivery;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", orderUser=" + orderUser +
                ", oderDishes=" + oderDishes +
                ", dishesSum=" + dishesSum +
                ", dateTime=" + dateTime +
                ", delivery=" + delivery +
                '}';
    }
}
