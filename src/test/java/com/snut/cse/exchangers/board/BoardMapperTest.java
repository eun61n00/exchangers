package com.snut.cse.exchangers.board;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.domain.Criteria;
import com.snut.cse.exchangers.board.mapper.BoardMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml")
@Log4j
public class BoardMapperTest {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper boardMapper;

    @Test
    public void testSelectAll() {
        boardMapper.selectAll().forEach(boardVO -> log.info(boardVO));
    }

    @Test
    public void testSelectWithPaging() {
        Criteria criteria = new Criteria(2, 10);
        boardMapper.selectWithPaging(criteria).forEach(boardVO -> log.info(boardVO));
    }

    @Test
    public void testSelect() {
        log.info(boardMapper.select(1));
    }

    @Test
    public void testInsert() {
        BoardVO boardVO = new BoardVO();
        boardVO.setTitle("test title");
        boardVO.setContent("test content");
        boardVO.setWriter("writer00");

        boardMapper.insert(boardVO);
        log.info(boardVO);
    }

    @Test
    public void testInsertSelectKey() {
        BoardVO boardVO = new BoardVO();
        boardVO.setTitle("test title");
        boardVO.setContent("test content");
        boardVO.setWriter("writer00");

        boardMapper.insertSelectKey(boardVO);
        log.info(boardVO);
    }

    @Test
    public void testUpdate() {
        BoardVO boardVO = boardMapper.select(4);
        boardVO.setTitle("수정된 제목");
        boardVO.setContent("4번 테스트 게시물입니다.");
        boardVO.setWriter("writer04");

        boardMapper.update(boardVO);
    }

    @Test
    public void testDelete() {
        boardMapper.delete(8);
    }

}
