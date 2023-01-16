package com.snut.cse.exchangers.board.domain;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO {

    private int board_no;

    private String title;

    private String content;

    private String category;

    private String writer;

    private Date regdate;

    private Date updatedate;

    private int viewcnt;

}
