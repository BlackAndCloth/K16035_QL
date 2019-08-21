package com.whpu.k16035.entity;

public class ShoppingCart {
    //商品
    private Dishe dishes;
    //数量
    private Integer dishesSum;

    public Dishe getDishes() {
        return dishes;
    }

    public void setDishes(Dishe dishes) {
        this.dishes = dishes;
    }

    public Integer getDishesSum() {
        return dishesSum;
    }

    public void setDishesSum(Integer dishesSum) {
        this.dishesSum = dishesSum;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "dishes=" + dishes +
                ", dishesSum=" + dishesSum +
                '}';
    }
}
