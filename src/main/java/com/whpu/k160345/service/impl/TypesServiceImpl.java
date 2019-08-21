package com.whpu.k160345.service.impl;

import com.whpu.k160345.dao.TypesDao;
import com.whpu.k160345.entity.Types;
import com.whpu.k160345.service.TypesService;

import java.util.List;

public class TypesServiceImpl implements TypesService {
    private TypesDao typesDao;



    @Override
    public List<Types> selectTypesAll(Integer page) {
        return typesDao.selectTypesAll(page);
    }

    @Override
    public void updateTypeById(Integer id) {
        typesDao.updateTypeById(id);
    }

    @Override
    public Types selectTypeById(Integer id) {
        return typesDao.selectTypeById(id);
    }

    @Override
    public void deleteTypeById(Integer id) {
        typesDao.deleteTypeById(id);
    }

    @Override
    public void insertTypeById(Types types) {
        typesDao.insertTypeById(types);
    }

    @Override
    public Long selectPageSum() {
        return typesDao.selectPageSum();
    }


    public TypesDao getTypesDao() {
        return typesDao;
    }

    public void setTypesDao(TypesDao typesDao) {
        this.typesDao = typesDao;
    }
}
