package object.pojo;

import java.util.Date;

/**
 * Created by 花间一壶酒 on 2017/3/3.
 */
public class User {
    private String Id;
    private String username;
    private String passwords;
    private String number;
    private String email;
    private String onlines;
    private String IdCard;
    private Date birthday;
    private Date lastloginTime;
    private String lastloginIP;
    private String lastloginAddress;
    private String address;
    private Date createTime;

    @Override
    public String toString() {
        return "User{" +
                "Id='" + Id + '\'' +
                ", username='" + username + '\'' +
                ", passwords='" + passwords + '\'' +
                ", number='" + number + '\'' +
                ", email='" + email + '\'' +
                ", onlines='" + onlines + '\'' +
                ", IdCard='" + IdCard + '\'' +
                ", birthday=" + birthday +
                ", lastloginTime=" + lastloginTime +
                ", lastloginIP='" + lastloginIP + '\'' +
                ", lastloginAddress='" + lastloginAddress + '\'' +
                ", address='" + address + '\'' +
                ", createTime=" + createTime +
                '}';
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswords() {
        return passwords;
    }

    public void setPasswords(String passwords) {
        this.passwords = passwords;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOnlines() {
        return onlines;
    }

    public void setOnlines(String onlines) {
        this.onlines = onlines;
    }

    public String getIdCard() {
        return IdCard;
    }

    public void setIdCard(String idCard) {
        IdCard = idCard;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getLastloginTime() {
        return lastloginTime;
    }

    public void setLastloginTime(Date lastloginTime) {
        this.lastloginTime = lastloginTime;
    }

    public String getLastloginIP() {
        return lastloginIP;
    }

    public void setLastloginIP(String lastloginIP) {
        this.lastloginIP = lastloginIP;
    }

    public String getLastloginAddress() {
        return lastloginAddress;
    }

    public void setLastloginAddress(String lastloginAddress) {
        this.lastloginAddress = lastloginAddress;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}