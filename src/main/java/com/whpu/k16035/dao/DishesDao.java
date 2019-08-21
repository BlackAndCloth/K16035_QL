package com.whpu.k16035.dao;

/*
持久层的接口

 */

import com.whpu.k16035.entity.Dishe;

import java.util.List;

public interface DishesDao {
    //增删改查
    //查询全部
    List<Dishe> selectDishesAll();
    List<Dishe> selectDishesByPage(Integer page);
    Integer getPageSum();

    List<Dishe> getDishesRanking();

    Dishe selectDishesById(Integer dishesId);
}
