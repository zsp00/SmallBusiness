/**
 * Copyright© 2003-2016 浙江汇信科技有限公司, All Rights Reserved. <br/>
 */
package com.icinfo.cs.message.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.icinfo.framework.mybatis.mapper.annotation.Before;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * 描述:    cs_message_opanomaly 对应的实体类.<br>
 * WARNING：不是表中字段的属性必须加@Transient注解
 * @author framework generator
 * @date 2017年07月04日
 */
@Table(name = "cs_message_opanomaly")
public class MessageOpanoMaly implements Serializable {
    /**
     * 自增id
     */
    @Id
    @Column(name = "id")
    private Integer id;

    /**
     * 主键uid
     */
    @Column(name = "MsgUid")
    @Before
    @GeneratedValue(strategy = GenerationType.IDENTITY,generator="select replace(uuid(), '-', '')")
    private String msgUid;

    /**
     * 0,定时推送,1实时推送
     */
    @Column(name = "MsgType")
    private String msgType;

    /**
     * 发送内容
     */
    @Column(name = "Content")
    private String content;

    /**
     * 发送时间
     */
    @Column(name = "SetTime")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date setTime;
    
    @Column(name = "IsMove")
    private String isMove;

    /**
     * 设置人uid
     */
    @Column(name = "SetUserUid")
    private String setUserUid;

    /**
     * 设置人姓名
     */
    @Column(name = "SetUserName")
    private String setUserName;

    /**
     * 设置人部门名称
     */
    @Column(name = "SetDeptName")
    private String setDeptName;

    /**
     * 设置人部门编码
     */
    @Column(name = "SetDeptCode")
    private String setDeptCode;

    /**
     * 0推送成功，1推送失败
     */
    @Column(name = "State")
    private String state;

    /**
     * 时间戳
     */
    @Column(name = "CreateTime")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    
    /**
     * 联络员id
     */
    @Column(name = "LiaisonManId")
    private String liaisonManId;
    
    /**
     * 联络员姓名
     */
    @Column(name = "LiaisonManName")
    private String liaisonManName;

    /**
     * 联络员电话
     */
    @Column(name = "LiaisonManTel")
    private String liaisonManTel;

    private static final long serialVersionUID = 1L;

    /**
     * 获取自增id
     *
     * @return id - 自增id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置自增id
     *
     * @param id 自增id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    public String getLiaisonManName() {
		return liaisonManName;
	}

	public void setLiaisonManName(String liaisonManName) {
		this.liaisonManName = liaisonManName;
	}

	public String getLiaisonManTel() {
		return liaisonManTel;
	}

	public void setLiaisonManTel(String liaisonManTel) {
		this.liaisonManTel = liaisonManTel;
	}

	/**
     * 获取主键uid
     *
     * @return MsgUid - 主键uid
     */
    public String getMsgUid() {
        return msgUid;
    }

    /**
     * 设置主键uid
     *
     * @param msgUid 主键uid
     */
    public void setMsgUid(String msgUid) {
        this.msgUid = msgUid;
    }

    /**
     * 获取0,定时推送,1实时推送
     *
     * @return MsgType - 0,定时推送,1实时推送
     */
    public String getMsgType() {
        return msgType;
    }

    /**
     * 设置0,定时推送,1实时推送
     *
     * @param msgType 0,定时推送,1实时推送
     */
    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    /**
     * 获取发送内容
     *
     * @return Content - 发送内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置发送内容
     *
     * @param content 发送内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取发送时间
     *
     * @return SetTime - 发送时间
     */
    public Date getSetTime() {
        return setTime;
    }

    /**
     * 设置发送时间
     *
     * @param setTime 发送时间
     */
    public void setSetTime(Date setTime) {
        this.setTime = setTime;
    }

    /**
     * 获取设置人uid
     *
     * @return SetUserUid - 设置人uid
     */
    public String getSetUserUid() {
        return setUserUid;
    }

    /**
     * 设置设置人uid
     *
     * @param setUserUid 设置人uid
     */
    public void setSetUserUid(String setUserUid) {
        this.setUserUid = setUserUid;
    }

    /**
     * 获取设置人姓名
     *
     * @return SetUserName - 设置人姓名
     */
    public String getSetUserName() {
        return setUserName;
    }

    /**
     * 设置设置人姓名
     *
     * @param setUserName 设置人姓名
     */
    public void setSetUserName(String setUserName) {
        this.setUserName = setUserName;
    }

    /**
     * 获取设置人部门名称
     *
     * @return SetDeptName - 设置人部门名称
     */
    public String getSetDeptName() {
        return setDeptName;
    }

    /**
     * 设置设置人部门名称
     *
     * @param setDeptName 设置人部门名称
     */
    public void setSetDeptName(String setDeptName) {
        this.setDeptName = setDeptName;
    }

    /**
     * 获取设置人部门编码
     *
     * @return SetDeptCode - 设置人部门编码
     */
    public String getSetDeptCode() {
        return setDeptCode;
    }

    /**
     * 设置设置人部门编码
     *
     * @param setDeptCode 设置人部门编码
     */
    public void setSetDeptCode(String setDeptCode) {
        this.setDeptCode = setDeptCode;
    }

    /**
     * 获取0推送成功，1推送失败
     *
     * @return State - 0推送成功，1推送失败
     */
    public String getState() {
        return state;
    }

    /**
     * 设置0推送成功，1推送失败
     *
     * @param state 0推送成功，1推送失败
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * 获取时间戳
     *
     * @return CreateTime - 时间戳
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置时间戳
     *
     * @param createTime 时间戳
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public String getLiaisonManId() {
		return liaisonManId;
	}

	public void setLiaisonManId(String liaisonManId) {
		this.liaisonManId = liaisonManId;
	}

	public String getIsMove() {
		return isMove;
	}

	public void setIsMove(String isMove) {
		this.isMove = isMove;
	}
}