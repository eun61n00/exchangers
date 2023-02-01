package com.snut.cse.exchangers.board.controller;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.domain.Criteria;
import com.snut.cse.exchangers.board.domain.PageDTO;
import com.snut.cse.exchangers.board.service.BoardService;
import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/board")
@Log4j
@AllArgsConstructor
public class BoardController {

    private BoardService boardService;

    @GetMapping("/list")
    public void list(Criteria criteria, Model model, HttpServletRequest request){
        int total;
        total = boardService.getTotalCount();
        log.info("========= list (criteria: " + criteria + ") ==========");
        criteria.setOffset((criteria.getPageNum() - 1) * criteria.getAmount());
        model.addAttribute("list", boardService.getListWithPaging(criteria));
        model.addAttribute("pageDTO", new PageDTO(criteria, total));
        KakaoUserDTO kakaoUserDTO = (KakaoUserDTO) RequestContextUtils.getInputFlashMap(request);
        model.addAttribute("kakaoUserDTO", kakaoUserDTO);
    }

    @GetMapping("/read")
    public void read(@RequestParam("id") int id, @ModelAttribute("criteria") Criteria criteria, Model model) {
        log.info("========== read " + id + " ==========");
        model.addAttribute("board", boardService.read(id));
        log.info(criteria.toString());
    }

    @GetMapping("/update")
    public void update(@RequestParam("id") int id, @ModelAttribute("criteria") Criteria criteria, Model model) {
        log.info("========= update(GET) ==========");
        model.addAttribute("board", boardService.read(id));
    }

    @PostMapping("/update")
    public String update(BoardVO boardVO, @ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) {
        log.info("========= update(POST) ==========");
        if (boardService.update(boardVO)) {
            rttr.addFlashAttribute("msg", "update");
            rttr.addFlashAttribute("id", boardVO.getId());
            rttr.addFlashAttribute("pageNum", criteria.getPageNum());
            rttr.addFlashAttribute("amount", criteria.getAmount());
        }

        return "redirect:/board/list";
    }

    @GetMapping("/register")
    public void register(@ModelAttribute("criteria") Criteria criteria, Model model) {
        log.info("========= register(GET) ==========");
    }

    @PostMapping("/register")
    public String register(BoardVO boardVO, @ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) {
        log.info("========= register(POST) ==========");
        boardService.register(boardVO);
        rttr.addFlashAttribute("msg", "update");
        rttr.addFlashAttribute("id", boardVO.getId());
        rttr.addFlashAttribute("pageNum", criteria.getPageNum());
        rttr.addFlashAttribute("amount", criteria.getAmount());

        return "redirect:/board/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") int id, @ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) {
        log.info("========= delete ==========");
        boardService.delete(id);
        rttr.addFlashAttribute("msg", "delete");
        rttr.addFlashAttribute("id", id);
        rttr.addFlashAttribute("pageNum", criteria.getPageNum());
        rttr.addFlashAttribute("amount", criteria.getAmount());

//        return "/board/list?pageNum"
        return "redirect:/board/list";
    }

}
