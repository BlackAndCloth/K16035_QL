package com.whpu.k16035.service.impl;

import com.whpu.k16035.dao.impl.UserDaoImpl;
import com.whpu.k16035.entity.Users;
import com.whpu.k16035.service.UserService;


//服务层的实现类
public class UserServiceImpl implements UserService {
    //创建持久层的对象
    private UserDaoImpl userDao;

    @Override
    public String register(Users user) {
        return userDao.rigister(user);
    }

    @Override
    public Users login(String account, String password) {
        return userDao.login(account, password);
    }

    public UserDaoImpl getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDaoImpl userDao) {
        this.userDao = userDao;
    }
}
