package com.snut.cse.exchangers.board.mapper;

import com.snut.cse.exchangers.board.domain.BoardVO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardMapper {

    List<BoardVO> selectAll();

    void insert(BoardVO boardVO);

    void insertSelectKey(BoardVO boardVO);

    BoardVO select(int board_no);

    int update(BoardVO boardVO);

    int delete(int board_no);

}
