package com.whpu.k160345.service.impl;

import com.whpu.k160345.dao.AdminDao;
import com.whpu.k160345.entity.Admin;
import com.whpu.k160345.service.AdminService;

public class AdminServiceImpl implements AdminService {
    //业务层
    private AdminDao adminDao;
    @Override
    public Admin adminLogin(Admin admin) {
        return adminDao.adminLogin(admin);
    }

    @Override
    public void updateAdmin(Admin admin) {
        adminDao.updateAdmin(admin);
    }

    public AdminDao getAdminDao() {
        return adminDao;
    }

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }
}
