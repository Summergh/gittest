package cn.test;

import cn.gh.entity.Userinfo;
import cn.gh.service.IUserInfoService;
import cn.gh.util.JSONUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by guo on 2017/9/24.
 */
public class Mytest {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        IUserInfoService userService = (IUserInfoService)ctx.getBean("userService");
        Userinfo userinfo=new Userinfo();
        PageInfo<Userinfo> byPage = userService.findByPage(userinfo, 1, 2);
        System.out.println(JSONUtils.toJSON(byPage)+"-----123");
		System.out.println(JSONUtils.toJSON(byPage)+"-----12222223");
    }


}
