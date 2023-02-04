package com.snut.cse.exchangers.user.domain;

import lombok.Data;

import java.util.Date;

@Data
public class UserDTO {

    private String email;
    private String password;
    private String name;
    private Date regdate;
    private Date updatedate;
    private int enabled;

}
