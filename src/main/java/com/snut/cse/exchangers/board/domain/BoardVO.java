package com.snut.cse.exchangers.board.domain;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO {

    private int board_no;

    private String title;

    private String content;

    private String writer;

    private Date regDate;

    private Date updateDate;

    private int viewCnt;

}
