package cn.gh.dao;

import cn.gh.entity.Userinfo;

import java.util.List;

/**
 * Created by guo on 2017/9/24.
 */
public interface IUserInfo {

   public List<Userinfo> findByPage(Userinfo info);


}
