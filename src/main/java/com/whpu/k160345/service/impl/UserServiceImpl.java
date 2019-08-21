package com.whpu.k160345.service.impl;

import com.whpu.k160345.dao.UserDao;
import com.whpu.k160345.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
