package cn.gh.service.impl;

import cn.gh.dao.IUserInfo;
import cn.gh.entity.Userinfo;
import cn.gh.service.IUserInfoService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by guo on 2017/9/24.
 */
@Service("userService")
public class IUserInfoServiceImpl implements IUserInfoService{

    @Resource(name = "IUserInfo")
    IUserInfo iUserInfo;


    public PageInfo<Userinfo> findByPage(Userinfo info, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Userinfo> list = iUserInfo.findByPage(info);
        return new PageInfo<Userinfo>(list);
    }
}
