package com.whpu.k160345.service.impl;

import com.whpu.k160345.dao.DishesDao;
import com.whpu.k160345.entity.Dishes;
import com.whpu.k160345.entity.Types;
import com.whpu.k160345.service.DishesService;

import java.util.List;

public class DishesServiceImpl implements DishesService {
   //业务层
   private DishesDao dishesDao;
   @Override
   public List<Dishes> selectDishesAll(Integer page) {
      return dishesDao.selectDishesAll(page);
   }

    @Override
    public void insertDishes(Dishes dishes) {
        dishesDao.insertDishes(dishes);
    }

    @Override
    public Dishes selectDishesById(Integer id) {
        return dishesDao.selectDishesById(id);
    }

    @Override
    public void updateDishes(Dishes dishes) {
        dishesDao.updateDishes(dishes);
    }

    @Override
    public void deleteDishesById(Integer id) {
        dishesDao.deleteDishesById(id);
    }

    @Override
    public Long selectPageSum() {
        return dishesDao.selectPageSum();
    }

    @Override
    public List<Types> selectTypeList() {
        return dishesDao.selectTypeList();
    }


    public DishesDao getDishesDao() {
      return dishesDao;
   }

    public void setDishesDao(DishesDao dishesDao) {
      this.dishesDao = dishesDao;
   }
}
