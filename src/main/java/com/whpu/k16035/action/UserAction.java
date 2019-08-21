package com.whpu.k16035.action;

import com.opensymphony.xwork2.ActionContext;
import com.whpu.k16035.entity.ShoppingCart;
import com.whpu.k16035.entity.Users;
import com.whpu.k16035.service.impl.UserServiceImpl;

import java.util.ArrayList;
import java.util.List;


//控制层：处理请求
public class UserAction {
    //数据
    private Users user;
    private String Tips;

    //保存用户登录时输入的用户名和密码
    private String account;
    private String password;


    //登录成功后保存用户
    private Users LoggedUser;

    //服务层
    private UserServiceImpl userService;

    //注册
    public String register(){
        String result = userService.register(user);
        if (result.equals("register_success")){
            Tips = "注册成功，请登录！";
        }else {
            Tips = "注册失败，请重新注册！";
        }
        return result;
    }

    //登录验证
    public String login(){

        LoggedUser = userService.login(account, password);
        //判断是否登录成功
        if (LoggedUser == null){
            //登录失败
            Tips = "登录失败，请输入正确的用户名和密码！";
            return "login_fail";
        } else {
            //登录成功
            Tips = "登录成功，欢迎您！";
            //将用户对象存放到session中
            ActionContext.getContext().getSession().put("loggedUser",LoggedUser);
            List<ShoppingCart> shoppingCartList = new ArrayList<ShoppingCart>();
            ActionContext.getContext().getSession().put("shoppingCartList",shoppingCartList);
            return "login_success";
        }
    }




    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getTips() {
        return Tips;
    }

    public void setTips(String tips) {
        Tips = tips;
    }

    public UserServiceImpl getUserService() {
        return userService;
    }

    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }

    public Users getLoggedUser() {
        return LoggedUser;
    }

    public void setLoggedUser(Users loggedUser) {
        LoggedUser = loggedUser;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
