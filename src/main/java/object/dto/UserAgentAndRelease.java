package object.dto;

import object.pojo.Info;
import object.pojo.User;

import java.util.List;

/**
 * Created by 花间一壶酒 on 2017/4/22.
 */
public class UserAgentAndRelease {
    private User user;
    private List<Info> agent;
    private List<Info> release;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Info> getAgent() {
        return agent;
    }

    public void setAgent(List<Info> agent) {
        this.agent = agent;
    }

    public List<Info> getRelease() {
        return release;
    }

    public void setRelease(List<Info> release) {
        this.release = release;
    }
}
