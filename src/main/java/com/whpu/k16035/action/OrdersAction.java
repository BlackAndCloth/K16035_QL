package com.whpu.k16035.action;

import com.opensymphony.xwork2.ActionContext;
import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.entity.Order;
import com.whpu.k16035.entity.ShoppingCart;
import com.whpu.k16035.entity.Users;
import com.whpu.k16035.service.OrdersService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdersAction {
    //====================订单部分==============================
    //数据
    private List<Order> ordersLists;
    //服务层对象
    private OrdersService ordersService;
    private String dishesName;

    //获取用户的所有订单
    public String  getOrdersAllByUserId(){
        Users users = (Users)ActionContext.getContext().getSession().get("loggedUser");
        int userId = users.getId();
        //调用服务层的方法
        ordersLists = ordersService.getOrdersAllByUserId(userId);
        return "list";
    }

    //通过菜品名称查询订单
    public String getOrdersByName(){
        Users users = (Users)ActionContext.getContext().getSession().get("loggedUser");
        int userId = users.getId();
        ordersLists = ordersService.getOrdersByName(userId ,dishesName);

        return "list";
    }

    //查询已派送订单
    public String getOrdersBy1(){
        //查询用户的所有订单
        ordersLists = new ArrayList<Order>();
        Users users = (Users)ActionContext.getContext().getSession().get("loggedUser");
        int userId = users.getId();
        List<com.whpu.k16035.entity.Order> list = ordersService.getOrdersAllByUserId(userId);
        //将已派送的添加到ordersList
        for (com.whpu.k16035.entity.Order orders : list) {
            if (orders.getDelivery() == 1){
                ordersLists.add(orders);
            }
        }
        return "list";
    }

    //查询未派送订单
    public String getOrdersBy0(){
        //查询用户的所有订单
        Users users = (Users)ActionContext.getContext().getSession().get("loggedUser");
        int userId = users.getId();
        List<com.whpu.k16035.entity.Order> list = ordersService.getOrdersAllByUserId(userId);
        //将未派送的添加到ordersList
        ordersLists = new ArrayList<Order>();
        for (Order orders : list) {
            if (orders.getDelivery() == 0){
                ordersLists.add(orders);
            }
        }
        return "list";
    }

    //下单
    public String placeOrders(){
        //获取session中的购物车数据
        //将数据添加到数据库
        //1.将数据生成订单数据保存到数据库中
        if (ActionContext.getContext().getSession().get("shoppingCartList") != null){
            List<ShoppingCart> shoppingCartList1 = (List<ShoppingCart>)ActionContext.getContext().getSession().get("shoppingCartList");
            if (shoppingCartList1.size() == 0){
                Tips = "您的餐车为空，无法提交订单，已为您跳转到主页";
                return "requert";
            }else {
                Users users = (Users) ActionContext.getContext().getSession().get("loggedUser");
                List<Order> ordersList1 = new ArrayList<>();
                for (ShoppingCart shoppingCart : shoppingCartList1) {
                    Order orders = new Order();
                    orders.setOrderUser(users);
                    orders.setDateTime(new Date());
                    orders.setDelivery(0);
                    orders.setDishesSum(shoppingCart.getDishesSum());
                    orders.setOderDishes(shoppingCart.getDishes());
                    ordersList1.add(orders);
                    //2.修改商品表中的sums值，设置销量
                    ordersService.addSums(shoppingCart.getDishes(), shoppingCart.getDishesSum());
                }
                ordersService.placeOrders(ordersList1);
                clearShoppingCart();
                Tips = "添加订单成功，已为您跳转到订单查询页面";
                return "add_success";
            }
        }
        Tips = "您尚未登录，请勿执行提交订单操作！";
        return "requert";
    }



















    //=====================购物车部分==================================
    //暂存的商品
    private Dishe dishes;
    private Integer dishesSum;
    private String Tips;
    //购物车
    private List<ShoppingCart> shoppingCartList;

    private Integer dishesPage;


    //加入购物车
    public String addToShoppingCart(){
        shoppingCartList = (List<ShoppingCart>)ActionContext.getContext().getSession().get("shoppingCartList");
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setDishes(dishes);
        shoppingCart.setDishesSum(dishesSum);
        shoppingCartList.add(shoppingCart);
        //将数据添加到购物车中
        ActionContext.getContext().getSession().put("shoppingCartList" , shoppingCartList);
        double priceSum1 = 0.0;
        Integer dishesSum1 = 0;
        for (ShoppingCart sc : shoppingCartList) {
            priceSum1 = priceSum1 + Double.parseDouble(sc.getDishes().getPrice()) * sc.getDishesSum();
            dishesSum1 = dishesSum1 + sc.getDishesSum();
        }
        //将小记和action存放到session
        ActionContext.getContext().getSession().put("priceSum" , priceSum1);
        ActionContext.getContext().getSession().put("dishesSum" , dishesSum1);
        return "requert";
    }

    //清空购物车
    public String clearShoppingCart(){
        shoppingCartList = (List<ShoppingCart>)ActionContext.getContext().getSession().get("shoppingCartList");
        if (shoppingCartList != null){
            shoppingCartList.clear();
            ActionContext.getContext().getSession().put("shoppingCartList" , shoppingCartList);
            double priceSum1 = 0.0;
            Integer dishesSum1 = 0;
            //将小记和action存放到session
            ActionContext.getContext().getSession().put("priceSum" , priceSum1);
            ActionContext.getContext().getSession().put("dishesSum" , dishesSum1);
        }
        return "requert";
    }

    //清空购物车
    public String clearShoppingCart2(){
        clearShoppingCart();
        return "requert2";
    }














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

    public List<ShoppingCart> getShoppingCartList() {
        return shoppingCartList;
    }

    public void setShoppingCartList(List<ShoppingCart> shoppingCartList) {

        this.shoppingCartList = shoppingCartList;
    }

    public Integer getDishesPage() {
        return dishesPage;
    }

    public void setDishesPage(Integer dishesPage) {
        this.dishesPage = dishesPage;
    }



    public OrdersService getOrdersService() {
        return ordersService;
    }

    public void setOrdersService(OrdersService ordersService) {

        this.ordersService = ordersService;
    }

    public String getTips() {
        return Tips;
    }

    public void setTips(String tips) {
        Tips = tips;
    }

    public String getDishesName() {
        return dishesName;
    }

    public void setDishesName(String dishesName) {
        this.dishesName = dishesName;
    }

    public List<Order> getOrdersLists() {
        return ordersLists;
    }

    public void setOrdersLists(List<Order> ordersLists) {
        this.ordersLists = ordersLists;
    }
}


