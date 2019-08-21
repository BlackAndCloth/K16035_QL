package com.whpu.k16035.action;

import com.opensymphony.xwork2.ActionContext;
import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.entity.Notice;
import com.whpu.k16035.entity.ShoppingCart;
import com.whpu.k16035.entity.Users;
import com.whpu.k16035.service.DishesService;
import com.whpu.k16035.service.impl.NoticeServiceImpl;
import com.whpu.k16035.service.impl.UserServiceImpl;

import java.util.List;

public class IndexAction {
    //数据
    private List<Dishe> dishesList;
    private Integer dishesPage;
    private Integer dishesPageSum;
    private String Tips;
    private List<Dishe> dishesListRanking;

    //购物车数据
//    购物车总金额
    private Double priceSum;
//    购物车总数量
    private Integer dishesSum;


    //登录成功后保存用户
    private Users LoggedUser;

    //服务层
    private DishesService dishesService;
    private NoticeServiceImpl noticeService;
    private UserServiceImpl userService;
    //数据
    private List<Notice> noticeList;



    public String index(){
        //设置页码（默认为1）
        if (dishesPage == null){
            dishesPage = 1;
        }
        //获取菜品
        dishesList = dishesService.selectDishesByPage(dishesPage);
        //获取菜品总页数
        dishesPageSum = dishesService.getPageSum();
        //获取前8条公告
        noticeList = noticeService.selectNoticeEight();
        //获取菜品销售排行榜
        dishesListRanking = dishesService.getDishesRanking();



        //获取餐车数据
        //判断是否已经登录
        LoggedUser = (Users) ActionContext.getContext().getSession().get("loggedUser");
        if (LoggedUser != null){
            //用户已登录
            //计算购物车数据
            priceSum = 0.0;
            dishesSum = 0;
            List<ShoppingCart> shoppingCartList = (List<ShoppingCart>)ActionContext.getContext().getSession().get("shoppingCartList");
            for (ShoppingCart shoppingCart : shoppingCartList) {
                priceSum = priceSum + Double.parseDouble(shoppingCart.getDishes().getPrice()) * shoppingCart.getDishesSum();
                dishesSum = dishesSum + shoppingCart.getDishesSum();
            }
        }

        return "index";
    }

    public String logout(){

        //判断账号是否已存在
        LoggedUser = (Users) ActionContext.getContext().getSession().get("loggedUser");
        if (LoggedUser == null){
            //账号未登录
            index();
            Tips = "您还未登录账号，无需退出！";
            return "index";
        }else {
            //清除session
            ActionContext.getContext().getSession().clear();
            index();
            Tips = "已退出账号！";
            return "index";
        }
    }

    //下一页
    public String indexDishesNextPage(){
        //获取菜品总页数
        dishesPageSum = dishesService.getPageSum();
        //判断是否为最后一页，不是最后一页的话页码加一
        if (dishesPage < dishesPageSum){
            dishesPage = dishesPage + 1;
        }
//        //获取菜品
//        dishesList = dishesService.selectDishesByPage(dishesPage);
//
//        //获取公告
//        noticeList = noticeService.selectNoticeAll();
        index();

        return "index";
    }

    //上一页
    public String indexDishesLastPage(){
        //判断页码是不是第一页 如果不是第一页 页码减一
        if (dishesPage > 1){
            dishesPage = dishesPage - 1;
        }
//        //获取菜品
//        dishesList = dishesService.selectDishesByPage(dishesPage);
//        //获取总页数
//        dishesPageSum = dishesService.getPageSum();
//
//        //获取公告
//        noticeList = noticeService.selectNoticeAll();
        index();

        return "index";
    }









    public List<Dishe> getDishesList() {
        return dishesList;
    }

    public void setDishesList(List<Dishe> dishesList) {
        this.dishesList = dishesList;
    }

    public Integer getDishesPage() {
        return dishesPage;
    }

    public void setDishesPage(Integer dishesPage) {
        this.dishesPage = dishesPage;
    }

    public Integer getDishesPageSum() {
        return dishesPageSum;
    }

    public void setDishesPageSum(Integer dishesPageSum) {
        this.dishesPageSum = dishesPageSum;
    }

    public DishesService getDishesService() {
        return dishesService;
    }

    public void setDishesService(DishesService dishesService) {
        this.dishesService = dishesService;
    }

    public List<Notice> getNoticeList() {
        return noticeList;
    }

    public void setNoticeList(List<Notice> noticeList) {
        this.noticeList = noticeList;
    }

    public NoticeServiceImpl getNoticeService() {
        return noticeService;
    }

    public void setNoticeService(NoticeServiceImpl noticeService) {
        this.noticeService = noticeService;
    }

    public String getTips() {
        return Tips;
    }

    public void setTips(String tips) {
        Tips = tips;
    }


    public Users getLoggedUser() {
        return LoggedUser;
    }

    public void setLoggedUser(Users loggedUser) {
        LoggedUser = loggedUser;
    }

    public UserServiceImpl getUserService() {
        return userService;
    }

    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }


    public Double getPriceSum() {
        return priceSum;
    }

    public void setPriceSum(Double priceSum) {
        this.priceSum = priceSum;
    }

    public Integer getDishesSum() {
        return dishesSum;
    }

    public void setDishesSum(Integer dishesSum) {

        this.dishesSum = dishesSum;
    }

    public List<Dishe> getDishesListRanking() {
        return dishesListRanking;
    }

    public void setDishesListRanking(List<Dishe> dishesListRanking) {
        this.dishesListRanking = dishesListRanking;
    }
}
