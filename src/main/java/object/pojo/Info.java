package object.pojo;

import java.util.Date;

/**
 * Created by 花间一壶酒 on 2017/4/22.
 */
public class Info {
    private String Id;
    private String numberOf;
    private String sex;
    private String week;
    private String weekday;
    private String unit;
    private String build;
    private String describe;
    private Date releaseTime;
    private String contact;
    private String roomOf;
    private String conditionA;
    private String conditionB;

    public String getConditionA() {
        return conditionA;
    }

    public void setConditionA(String conditionA) {
        this.conditionA = conditionA;
    }

    public String getConditionB() {
        return conditionB;
    }

    public void setConditionB(String conditionB) {
        this.conditionB = conditionB;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getRoomOf() {
        return roomOf;
    }

    public void setRoomOf(String roomOf) {
        this.roomOf = roomOf;
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getNumberOf() {
        return numberOf;
    }

    public void setNumberOf(String numberOf) {
        this.numberOf = numberOf;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getBuild() {
        return build;
    }

    public void setBuild(String build) {
        this.build = build;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }
}
