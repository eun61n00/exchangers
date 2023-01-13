package com.snut.cse.exchangers.board.service;

import com.snut.cse.exchangers.board.domain.BoardVO;
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
        return boardMapper.select(boardNo);
    }

    @Override
    public void update(BoardVO boardVO) {
        boardMapper.update(boardVO);
    }

    @Override
    public void delete(int boardNo) {
        boardMapper.delete(boardNo);
    }

    @Override
    public List<BoardVO> readAll() {
        return boardMapper.selectAll();
    }
}
