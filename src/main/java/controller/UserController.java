package controller;

import object.dto.NumberAndCode;
import object.dto.UserAgentAndRelease;
import object.dto.UserLogin;
import object.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;
import tool.DateEditor;
import tool.StringTool;
import tool.VerificationCode;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 花间一壶酒 on 2017/3/3.
 */
@Controller
@RequestMapping("/user")
public class UserController extends DateEditor {
    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    //用户登录控制器
    public ModelAndView userLogin(UserLogin userLogin) {
        Map<String, Object> params = new HashMap<String, Object>();
        //判断用户的登录方式
        if (userLogin.getUserLoginName() != null) {
            if (StringTool.isMaileic(userLogin.getUserLoginName())) {
                params.put("email", userLogin.getUserLoginName());
            } else if (StringTool.isNumeric(userLogin.getUserLoginName())) {
                params.put("number", userLogin.getUserLoginName());
            } else {
                params.put("username", userLogin.getUserLoginName());
            }
            //查询用户信息
            List<User> users = userService.select(params);
            //判断密码正确性
            if (users.get(0).getPasswords().equals(userLogin.getPassword())) {
                String userId;
                ModelAndView modelAndView = new ModelAndView();
                //将Id属性从用户信息中单独取出
                userId = users.get(0).getId();
                //通过id查询用户的代理与发布
                UserAgentAndRelease userAgentAndRelease = userService.selectUserAgentAndRelease(userId);
                //将用户信息放入返回的model中
                userAgentAndRelease.setUser(users.get(0));
                modelAndView.setViewName("/index");
                modelAndView.addObject("userAgentAndRelease", userAgentAndRelease);
                return modelAndView;
            } else return null;
        } else return null;
    }

    @RequestMapping(value = "/userRegister", method = RequestMethod.POST)
    @ResponseBody
    //用户通过手机号码注册获取验证码
    public NumberAndCode registerByNumber(@RequestBody NumberAndCode numberAndCode) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("number", numberAndCode.getNumber());
        List<User> users = userService.select(params);
        //判断号码是否被注册过
        if (users == null) {
            //查询到未注册时通过工具类获得验证码
            numberAndCode.setCode(VerificationCode.getVerificationCode(numberAndCode.getNumber()));
            //用于通知前端号码未注册
            numberAndCode.setMsg("b");
            return numberAndCode;
        } else {
            numberAndCode.setCode(VerificationCode.getVerificationCode(numberAndCode.getNumber()));
            //查询到被注册时用于通知前端号码已被注册
            numberAndCode.setMsg("a");
            return numberAndCode;
        }
    }

    @RequestMapping(value = "/SettingPassword", method = RequestMethod.POST)
    @ResponseBody
    //通过电话号码完成用户注册
    public String settingPasswordByPhone(String password, String msg, HttpServletRequest request) {
        //从前端传回的url中读取用户注册用电话号码
        String number = request.getParameter("number");
        //判断用户操作为注册还是找回
        if (msg.equals("0")) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("number", number);
            params.put("passwords", password);
            if (userService.insert(params)) {
                return password;//设置成功后返回密码
            } else return null;
        } else {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("wNumber", number);
            params.put("passwords", password);
            if (userService.update(params)) {
                return password;//更新成功后返回密码
            } else return null;
        }
    }

}
