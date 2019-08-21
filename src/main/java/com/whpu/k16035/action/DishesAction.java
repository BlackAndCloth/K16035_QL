package com.whpu.k16035.action;

import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.service.DishesService;

import java.util.List;


//控制层：处理请求
public class DishesAction {
    //数据
    private List<Dishe> dishesList;
    private Integer dishesPage;
    private Integer dishesPageSum;
    private Dishe dishes;
    private Integer dishesId;
    //服务层
    private DishesService dishesService;

    //查询全部
    public String selectDishesAll(){
        //调用服务层的方法
        dishesList = dishesService.selectDishesAll();
        dishesPageSum = dishesService.getPageSum();
        return "index";
    }
    //分页查询
    public String selectDishesPage(){
        if (dishesPage == null){
            dishesPage = 1;
        }
        //调用服务层的方法
        dishesList = dishesService.selectDishesByPage(dishesPage);
        dishesPageSum = dishesService.getPageSum();
        return "index";
    }

    public List<Dishe> selectDishesAllByPage(){
        //调用服务层的方法
        dishesList = dishesService.selectDishesByPage(dishesPage);
        dishesPageSum = dishesService.getPageSum();
        return dishesList;
    }

    public String selectDishesNextPage(){
        dishesPageSum = dishesService.getPageSum();
        if (dishesPage < dishesPageSum){
            dishesPage = dishesPage + 1;
        }
        dishesList = dishesService.selectDishesByPage(dishesPage);
        return "index";
    }

    public String selectDishesLastPage(){
        if (dishesPage > 1){
            dishesPage = dishesPage - 1;
        }
        dishesList = dishesService.selectDishesByPage(dishesPage);
        dishesPageSum = dishesService.getPageSum();
        return "index";
    }
    //根据id查询菜品信息
    public String selectDishesById(){
        dishes = dishesService.selectDishesById(dishesId);
        return "show";

    }





    public List<Dishe> getDishesList() {
        return dishesList;
    }

    public void setDishesList(List<Dishe> dishesList) {
        this.dishesList = dishesList;
    }

    public DishesService getDishesService() {
        return dishesService;
    }

    public void setDishesService(DishesService dishesService) {
        this.dishesService = dishesService;
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

    public Dishe getDishes() {
        return dishes;
    }

    public void setDishes(Dishe dishes) {
        this.dishes = dishes;
    }

    public Integer getDishesId() {
        return dishesId;
    }

    public void setDishesId(Integer dishesId) {
        this.dishesId = dishesId;
    }
}
