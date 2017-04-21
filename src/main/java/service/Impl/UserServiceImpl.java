package service.Impl;

import mapper.UserMapper;
import object.pojo.User;
import org.springframework.stereotype.Service;
import service.UserService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 花间一壶酒 on 2017/3/7.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource(name = "userMapper")
    private UserMapper userMapper;

    public List<User> select(Map<String, Object> params) {//以键值对的形式将数据传送至此方法
        List<User> userList = userMapper.select(params);
        if (null != userList && userList.size() > 0) {//判断是否查询到数值
            return userList;
        }
        return null;
    }

    public boolean insert(Map<String, Object> params) {//以键值对的形式将数据传送至此方法
        Integer insertId = userMapper.insert(params);//插入成功后将返回改变的行数值
        return insertId > 0;//判断返回的改变行数值是否大于0，判断成功与否
    }

    public boolean update(Map<String, Object> params) {
        Integer insertId = userMapper.update(params);//更新成功后将返回改变的行数值
        return insertId > 0;//判断返回的改变行数值是否大于0，判断成功与否
    }

}
