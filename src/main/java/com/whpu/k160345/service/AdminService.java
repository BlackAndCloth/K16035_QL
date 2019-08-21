package com.whpu.k160345.service;

import com.whpu.k160345.entity.Admin;

public interface AdminService {
    public Admin adminLogin(Admin admin);

    public void updateAdmin(Admin admin);
}
