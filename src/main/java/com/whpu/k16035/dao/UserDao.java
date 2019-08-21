package com.whpu.k16035.dao;

/*
持久层的接口

 */

import com.whpu.k16035.entity.Users;

public interface UserDao {
    String rigister(Users user);

    Users login(String account, String password);

}
