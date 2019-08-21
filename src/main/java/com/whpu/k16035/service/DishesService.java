package com.whpu.k16035.service;



//服务层

import com.whpu.k16035.entity.Dishe;

import java.util.List;

public interface DishesService {
    List<Dishe> selectDishesAll();
    List<Dishe> selectDishesByPage(Integer page);
    Integer getPageSum();


    List<Dishe> getDishesRanking();

    Dishe selectDishesById(Integer dishesId);
}
