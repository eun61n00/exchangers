package com.snut.cse.exchangers.reply.service;

import com.snut.cse.exchangers.commons.paging.Criteria;
import com.snut.cse.exchangers.reply.domain.ReplyVO;

import java.util.List;

public interface ReplyService {

    List<ReplyVO> list(Integer articleNo) throws Exception;

    void create(ReplyVO replyVO) throws Exception;

    void update(ReplyVO replyVO) throws Exception;

    void delete(Integer replyNo) throws Exception;

    List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception;

    int countReplies(Integer articleNo) throws Exception;

}