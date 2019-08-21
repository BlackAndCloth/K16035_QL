package com.whpu.k16035.service;



//服务层

import com.whpu.k16035.entity.Users;

public interface UserService {
    String register(Users user);
    Users login(String account, String password);

}
