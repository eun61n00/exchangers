package com.snut.cse.exchangers.board.mapper;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.domain.Criteria;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BoardMapper {

    List<BoardVO> selectAll();

    List<BoardVO> selectWithPaging(Criteria criteria);

    int getTotalCount();

    void insert(BoardVO boardVO);

    void insertSelectKey(BoardVO boardVO);

    BoardVO select(int id);

    int update(BoardVO boardVO);

    int delete(int id);

    int updateViewCount(int id);

    List<String> getCategoryList();

}
