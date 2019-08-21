package com.whpu.k160345.dao;

import com.whpu.k160345.entity.Admin;

public interface AdminDao {
   public Admin adminLogin(Admin admin);

   public void updateAdmin(Admin admin);
}
