package com.snut.cse.exchangers.board.service;

import com.snut.cse.exchangers.board.domain.BoardVO;

import java.util.List;

public interface BoardService {

    void register(BoardVO boardVO);

    BoardVO read(int boardNo);

    void update(BoardVO boardVO);

    void delete(int boardNo);

    List<BoardVO> readAll();

}
