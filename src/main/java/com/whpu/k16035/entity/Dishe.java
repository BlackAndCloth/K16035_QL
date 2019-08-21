package com.whpu.k16035.entity;

public class Dishe {
    //创建与表对应的属性
    private Integer id;
    private String name;
    private String recipe;
    private String brief;
    private String price;
    private String sums;
    private String priceAssociator;
    private String sumsAssociator;
    private String imgpath;
    //多对一
    //    private Integer typeId;
    private Types types;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRecipe() {
        return recipe;
    }

    public void setRecipe(String recipe) {
        this.recipe = recipe;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSums() {
        return sums;
    }

    public void setSums(String sums) {
        this.sums = sums;
    }

    public String getPriceAssociator() {
        return priceAssociator;
    }

    public void setPriceAssociator(String priceAssociator) {
        this.priceAssociator = priceAssociator;
    }

    public String getSumsAssociator() {
        return sumsAssociator;
    }

    public void setSumsAssociator(String sumsAssociator) {
        this.sumsAssociator = sumsAssociator;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public Types getTypes() {
        return types;
    }

    public void setTypes(Types types) {
        this.types = types;
    }

    @Override
    public String toString() {
        return "Dishes{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", recipe='" + recipe + '\'' +
                ", brief='" + brief + '\'' +
                ", price='" + price + '\'' +
                ", sums='" + sums + '\'' +
                ", priceAssociator='" + priceAssociator + '\'' +
                ", sumsAssociator='" + sumsAssociator + '\'' +
                ", imgpath='" + imgpath + '\'' +
                ", types=" + types +
                '}';
    }
}
