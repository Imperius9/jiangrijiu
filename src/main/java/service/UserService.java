package service;

import object.dto.UserAgentAndRelease;
import object.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * Created by 花间一壶酒 on 2017/3/7.
 */
public interface UserService {
    List<User> select(Map<String, Object> params);
    boolean insert(Map<String,Object> params);
    boolean update(Map<String, Object> params);
    UserAgentAndRelease selectUserAgentAndRelease(String params);
}
