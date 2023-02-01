package com.snut.cse.exchangers.user.domain;

import lombok.Data;

import java.util.Date;

@Data
public class KakaoUserDTO {

    private String email;
    private String name;
    private Date regdate;
    private Date updatedate;
    private int enabled;

}
