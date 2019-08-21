package com.whpu.k160345.service;

import com.whpu.k160345.entity.Dishes;
import com.whpu.k160345.entity.Types;

import java.util.List;

public interface DishesService {
    //查询全部菜单
   public List<Dishes> selectDishesAll(Integer page);
    //添加菜单
   public void insertDishes(Dishes dishes);

    public Dishes selectDishesById(Integer id);

    public void updateDishes(Dishes dishes);

    public void deleteDishesById(Integer id);

    public Long selectPageSum();

    public List<Types> selectTypeList();
}
