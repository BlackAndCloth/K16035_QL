package com.whpu.k160345.action;

import com.whpu.k160345.entity.Dishes;
import com.whpu.k160345.entity.Types;
import com.whpu.k160345.service.DishesService;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import java.io.File;
import java.util.List;


public class DishesAction {

    //接收Dishes数据
    private List<Dishes> dishesList;
    //接收前台Dishes数据
    private Dishes dishes;
    //接收前台type数据
    private String type;
    //接收前台
    private Integer id;
    //接收前台img数据
    private File imgpath;
    //图片类型
    private String imgpathContentType;
    //图片名字
    private String imgpathFileName;
    private List<Types> typesList;
    private Long pageSum;
    private Integer page;
    //服务层
    private DishesService dishesServiceM;

    //后台查询菜单全部
    public String selectDishesAll(){
        if(dishesServiceM.selectPageSum() % 8 == 0){
            pageSum = dishesServiceM.selectPageSum() / 8;
        }else {
            pageSum = (dishesServiceM.selectPageSum() / 8) + 1;
        }
        dishesList = dishesServiceM.selectDishesAll(page);
        return "list";
    }
    public String insertDishesPage(){
        typesList = dishesServiceM.selectTypeList();
        return "insertPage";
    }
    public String insertDishes(){
        Types types = new Types();
        types.setId(Integer.parseInt(type));
        dishes.setTypes(types);
        try{
            String realPath = ServletActionContext.getServletContext().getRealPath("/bookimg");
            String savePath = "F:\\idea-ws" + "\\K16035_QL\\src\\main\\webapp\\bookimg";
            File file1 = new File(realPath,imgpathFileName);
            File file2 = new File(savePath,imgpathFileName);
            FileUtil.copyFile(imgpath,file1);
            FileUtil.copyFile(imgpath,file2);
        }catch (Exception e){
            e.printStackTrace();
            return "null";
        }
        dishes.setImgpath("../bookimg/"+imgpathFileName);
        dishes.setSums("0");
        dishes.setSumsAssociator("0");
        dishesServiceM.insertDishes(dishes);
        return "requert";
    }

    public String selectDishesById(){
        typesList = dishesServiceM.selectTypeList();
        dishes = dishesServiceM.selectDishesById(id);
        return "updateDishes";
    }
    public String updateDishes(){
        Types types = new Types();
        types.setId(Integer.parseInt(type));
        dishes.setTypes(types);
        try{
            String realPath = ServletActionContext.getServletContext().getRealPath("/bookimg");
            String savePath = "F:\\idea-ws" + "\\K16035_QL\\src\\main\\webapp\\bookimg";
            File file1 = new File(realPath,imgpathFileName);
            File file2 = new File(savePath,imgpathFileName);
            FileUtil.copyFile(imgpath,file1);
            FileUtil.copyFile(imgpath,file2);
        }catch (Exception e){
            e.printStackTrace();
            return "null";
        }
        dishes.setImgpath("../bookimg/"+imgpathFileName);
        dishesServiceM.updateDishes(dishes);
        return "requert";
    }
    public String deleteDishesById(){
        dishesServiceM.deleteDishesById(id);
        return "requert";
    }
    public List<Dishes> getDishesList() {
        return dishesList;
    }

    public void setDishesList(List<Dishes> dishesList) {
        this.dishesList = dishesList;
    }

    public DishesService getDishesServiceM() {
        return dishesServiceM;
    }

    public void setDishesServiceM(DishesService dishesService) {
        this.dishesServiceM = dishesService;
    }

    public Dishes getDishes() {
        return dishes;
    }

    public void setDishes(Dishes dishes) {
        this.dishes = dishes;
    }

    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }

    public File getImgpath() {
        return imgpath;
    }

    public void setImgpath(File imgpath) {
        this.imgpath = imgpath;
    }

    public String getImgpathContentType() {
        return imgpathContentType;
    }

    public void setImgpathContentType(String imgpathContentType) {
        this.imgpathContentType = imgpathContentType;
    }

    public String getImgpathFileName() {
        return imgpathFileName;
    }

    public void setImgpathFileName(String imgpathFileName) {
        this.imgpathFileName = imgpathFileName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getPageSum() {
        return pageSum;
    }

    public void setPageSum(Long pageSum) {
        this.pageSum = pageSum;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public List<Types> getTypesList() {
        return typesList;
    }

    public void setTypesList(List<Types> typesList) {
        this.typesList = typesList;
    }
}
