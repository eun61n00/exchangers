package com.snut.cse.exchangers.board.service;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.domain.Criteria;

import java.util.List;

public interface BoardService {

    void register(BoardVO boardVO);

    BoardVO read(int boardNo);

    boolean update(BoardVO boardVO);

    boolean delete(int boardNo);

    List<BoardVO> getList();
    List<BoardVO> getListWithPaging(Criteria criteria);

    int getTotalCount();

    boolean updateViewCount(int boardNo);

    List<String> getCategoryList();

}
