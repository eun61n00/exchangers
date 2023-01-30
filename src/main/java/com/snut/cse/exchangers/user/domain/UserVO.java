package com.snut.cse.exchangers.user.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class UserVO {

    private String id;
    private String pw;
    private String name;
    private boolean enabled;

    private Date regdate;
    private Date updatedate;
    private List<AuthVO> authVOList;

}
