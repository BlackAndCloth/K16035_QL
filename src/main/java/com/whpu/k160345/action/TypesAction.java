package com.whpu.k160345.action;

import com.whpu.k160345.entity.Types;
import com.whpu.k160345.service.TypesService;

import java.util.List;

public class TypesAction {
    private TypesService typesServiceM;

    private List<Types> typeList;
    private Types types;
    private Integer id;
    private Long pageSum;
    private Integer page;
    public String selectTypesAll(){if(typesServiceM.selectPageSum() % 8 ==0){
        pageSum = typesServiceM.selectPageSum() / 8;
    }else {
        pageSum = (typesServiceM.selectPageSum() / 8) + 1;
    }
        typeList = typesServiceM.selectTypesAll(page);
        return "list";
    }
    public String selectTypeById(){
        types = typesServiceM.selectTypeById(id);
        return "updateType";
    }
    public String insertTypeById(){
        typesServiceM.insertTypeById(types);
        return "requert";
    }
    public String updateTypeById(){
        typesServiceM.updateTypeById(id);
        return "requert";
    }
    public String deleteTypeById(){
        typesServiceM.deleteTypeById(id);
        return "requert";
    }

    public TypesService getTypesServiceM() {
        return typesServiceM;
    }

    public void setTypesServiceM(TypesService typesService) {
        this.typesServiceM = typesService;
    }

    public List<Types> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<Types> typeList) {
        this.typeList = typeList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Types getTypes() {
        return types;
    }

    public void setTypes(Types types) {
        this.types = types;
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
}
