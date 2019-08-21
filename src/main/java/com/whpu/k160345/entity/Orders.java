package com.whpu.k160345.entity;

import java.util.Date;

public class Orders {
    private Integer id;
    private String name;
    private String dishesSum;
    private Date dateTime;
    private String delivery;
    private Dishes dishes;
    private User user;

    public Orders() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDelivery() {
        return delivery;
    }

    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    public String getDishesSum() {
        return dishesSum;
    }

    public void setDishesSum(String dishesSum) {
        this.dishesSum = dishesSum;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Dishes getDishes() {
        return dishes;
    }

    public void setDishes(Dishes dishes) {
        this.dishes = dishes;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", dishesSum='" + dishesSum + '\'' +
                ", dateTime=" + dateTime +
                ", delivery='" + delivery + '\'' +
                ", dishes=" + dishes +
                ", user=" + user +
                '}';
    }
}
