package cn.gh.service;

import cn.gh.entity.Userinfo;
import com.github.pagehelper.PageInfo;



/**
 * Created by guo on 2017/9/24.
 */
public interface IUserInfoService {

    public PageInfo<Userinfo> findByPage(Userinfo info, int pageIndex, int pageSize);
}
