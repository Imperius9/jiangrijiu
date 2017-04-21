package object.pojo;

import java.util.List;

/**
 * Created by 花间一壶酒 on 2017/3/9.
 */
public class Users {
    List<User> users;

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Users{" +
                "users=" + users +
                '}';
    }
}
