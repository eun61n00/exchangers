package com.snut.cse.exchangers.board;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.domain.Criteria;
import com.snut.cse.exchangers.board.service.BoardService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml")
@Log4j
public class BoardServiceTest {

    @Setter(onMethod_ = {@Autowired})
    private BoardService service;

    @Test
    public void testExist() {
        log.info(service);
        assertNotNull(service);
    }

    @Test
    public void testRegister() {

        for (int i = 0; i < 100; i++) {
            BoardVO boardVO = new BoardVO();
            boardVO.setTitle("new registered board");
            boardVO.setContent("test contents - new registered board");
            boardVO.setWriter("eunbin");
            boardVO.setCategory("기타");

            service.register(boardVO);
            log.info(boardVO);
        }
    }

    @Test
    public void testRead() {
        log.info(service.read(12));
    }

    @Test
    public void testGetList() {
        service.getList().forEach(boardVO -> log.info(boardVO));
    }

    @Test
    public void testGetListWithPaging() {
        service.getListWithPaging(new Criteria(5, 10)).forEach(boardVO -> log.info(boardVO));
    }

    @Test
    public void testGetTotalCount() {
        log.info(service.getTotalCount());

    }

    @Test
    public void testUpate() {
        BoardVO boardVO = service.read(12);
        boardVO.setContent("test modified contents I am hungry");

        service.update(boardVO);
    }

    @Test
    public void testDelete() {
        service.delete(6);
    }

}
