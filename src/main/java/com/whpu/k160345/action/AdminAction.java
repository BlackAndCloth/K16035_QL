package com.whpu.k160345.action;

import com.whpu.k160345.entity.Admin;
import com.whpu.k160345.service.AdminService;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AdminAction {
    //服务层
    private AdminService adminServiceM;
    private String password;
    //管理员对象  接收数据
    private Admin admin;

    //管理员登陆验证
    public String adminLogin(){
        HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("Admin",adminServiceM.adminLogin(admin));
        if(adminServiceM.adminLogin(admin) != null) {
            return "success";
        }else {
            return "out";
        }
    }
    public String updateAdmin(){
        HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        admin = (Admin) session.getAttribute("Admin");
        admin.setPassword(password);
        adminServiceM.updateAdmin(admin);
        return "update";
    }
    public String adminOut(){
        HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.invalidate();
        return "out";
    }

    public AdminService getAdminServiceM() {
        return adminServiceM;
    }

    public void setAdminServiceM(AdminService adminServiceM) {
        this.adminServiceM = adminServiceM;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
