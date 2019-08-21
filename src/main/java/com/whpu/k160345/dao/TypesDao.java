package com.whpu.k160345.dao;

import com.whpu.k160345.entity.Types;

import java.util.List;

public interface TypesDao {
    public List<Types> selectTypesAll(Integer page);

    public void updateTypeById(Integer id);

    public Types selectTypeById(Integer id);

    public void deleteTypeById(Integer id);

    public void insertTypeById(Types types);

    public Long selectPageSum();
}
