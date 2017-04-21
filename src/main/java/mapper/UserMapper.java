package mapper;

import object.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by 花间一壶酒 on 2017/3/3.
 */
@Repository
public interface UserMapper {
    List<User> select(Map<String, Object> params);
    int insert(Map<String, Object> params);
    int update(Map<String, Object> params);
}
