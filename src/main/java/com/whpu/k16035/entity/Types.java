package com.whpu.k16035.entity;

import com.whpu.k160345.entity.Dishes;

import java.util.Set;

public class Types {
    //创建与表对应的属性
    private Integer id;
    private String type;

    private Set<Dishes> dishSet;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Set<Dishes> getDishSet() {
        return dishSet;
    }

    public void setDishSet(Set<Dishes> dishSet) {
        this.dishSet = dishSet;
    }

    @Override
    public String toString() {
        return "Types{" +
                "id=" + id +
                ", type='" + type + '\'' +
                '}';
    }
}
