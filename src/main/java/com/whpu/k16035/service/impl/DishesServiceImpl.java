package com.whpu.k16035.service.impl;

import com.whpu.k16035.dao.impl.DishesDaoImpl;
import com.whpu.k16035.entity.Dishe;
import com.whpu.k16035.service.DishesService;

import java.util.List;


//服务层的实现类
public class DishesServiceImpl implements DishesService {
    //创建持久层的对象
    private DishesDaoImpl dishesDao;



    //查询全部
    @Override
    public List<Dishe> selectDishesAll() {
        return dishesDao.selectDishesAll();
    }

    @Override
    public List<Dishe> selectDishesByPage(Integer page) {
        return dishesDao.selectDishesByPage(page);
    }

    @Override
    public Integer getPageSum() {
        return dishesDao.getPageSum();
    }

    @Override
    public List<Dishe> getDishesRanking() {
        return dishesDao.getDishesRanking();
    }

    @Override
    public Dishe selectDishesById(Integer dishesId) {

        return dishesDao.selectDishesById(dishesId);
    }


    //======================================================

    public DishesDaoImpl getDishesDao() {
        return dishesDao;
    }

    public void setDishesDao(DishesDaoImpl dishesDao) {
        this.dishesDao = dishesDao;
    }


}
