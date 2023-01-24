package com.snut.cse.exchangers.board.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

    private int startPage;
    private int endPage;
    private boolean prev, next;

    private Criteria criteria;
    private int total;

    public PageDTO(Criteria criteria, int total) {
        this.criteria = criteria;
        this.total = total;

        this.endPage = (int)(Math.ceil(criteria.getPageNum() / 10.0)) * 10;
        this.startPage = this.endPage - 9;
        int realEndPage = (int)(Math.ceil((total * 1.0) / criteria.getAmount()));
        if (realEndPage < this.endPage)
            this.endPage = realEndPage;

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEndPage;
    }

}
