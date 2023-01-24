package com.snut.cse.exchangers.board.service;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.domain.Criteria;
import com.snut.cse.exchangers.board.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    @Setter(onMethod_ = {@Autowired})
    private BoardMapper boardMapper;

    @Override
    public void register(BoardVO boardVO) {
        boardMapper.insertSelectKey(boardVO);
    }

    @Override
    public BoardVO read(int boardNo) {
        boardMapper.updateViewCount(boardNo);
        return boardMapper.select(boardNo);
    }

    @Override
    public boolean update(BoardVO boardVO) {
        return boardMapper.update(boardVO) == 1;
    }

    @Override
    public boolean delete(int boardNo) {
        return boardMapper.delete(boardNo) == 1;
    }

    @Override
    public List<BoardVO> getList() {
        return boardMapper.selectAll();
    }

    public List<BoardVO> getListWithPaging(Criteria criteria) {
        return boardMapper.selectWithPaging(criteria);
    }

    public int getTotalCount() {
        return boardMapper.getTotalCount();
    }

    @Override
    public boolean updateViewCount(int boardNo) {
        return boardMapper.updateViewCount(boardNo) == 1;
    }

    @Override
    public List<String> getCategoryList() {
        return boardMapper.getCategoryList();
    }
}
