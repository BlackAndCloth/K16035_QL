package com.whpu.k16035.dao.impl;


//持久层

import com.whpu.k16035.dao.UserDao;
import com.whpu.k16035.entity.Users;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
    @Override
    public String rigister(Users user) {
        //判断用户名是否已存在

//
//        //查询全部数据

        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("from Users where account = :account");
        query.setParameter("account" , user.getAccount());
        List<Users> usersList = query.list();
        session.close();

        if (usersList.size() == 0){
            //用户名不存在，将数据保存到数据库
            this.getHibernateTemplate().save(user);
            return "register_success";
        }else {
            return "register_fail";
        }
    }

    @Override
    public Users login(String account, String password) {
        //查询账号密码相符的数据
        Session session = this.getSessionFactory().openSession();
        Query query = session.createQuery("from Users where account = :account and password = :password");
        query.setParameter("account" , account);
        query.setParameter("password" , password);
        List<Users> usersList = query.list();
        session.close();

        //判断数据是否存在
        if (usersList.size() != 0){
            //数据存在，返回用户信息
            Users user = usersList.get(0);
            return user;
        }else {
            //数据不存在，返回空值
            return null;
        }
    }
}
