package com.whpu.k160345.action;

import com.whpu.k160345.service.UserService;

public class UserAction {
    private UserService userServiceM;

    public UserService getUserServiceM() {
        return userServiceM;
    }

    public void setUserServiceM(UserService userService) {
        this.userServiceM = userService;
    }
}
