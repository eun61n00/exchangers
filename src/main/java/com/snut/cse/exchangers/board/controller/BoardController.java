package com.snut.cse.exchangers.board.controller;

import com.snut.cse.exchangers.board.domain.BoardVO;
import com.snut.cse.exchangers.board.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board")
@Log4j
@AllArgsConstructor
public class BoardController {

    private BoardService boardService;

    @GetMapping("/list")
    public void list(Model model){
        model.addAttribute("list", boardService.readAll());
    }

    @GetMapping({"/read", "/update"})
    public void read(@RequestParam("board_no") int board_no, Model model) {
        model.addAttribute("board", boardService.read(board_no));
    }

    @PostMapping("/update")
    public String update(BoardVO boardVO, RedirectAttributes rttr) {
        if (boardService.update(boardVO)) {
            rttr.addFlashAttribute("update_result", "success");
            rttr.addFlashAttribute("board_no", boardVO.getBoard_no());
        }

        return "redirect:/board/list";
    }

    @GetMapping("/register")
    public void register(Model model) {
    }

    @PostMapping("/register")
    public String register(BoardVO boardVO, RedirectAttributes rttr) {
        boardService.register(boardVO);
        rttr.addFlashAttribute("register_result", "success");
        rttr.addFlashAttribute("board_no", boardVO.getBoard_no());

        return "redirect:/board/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("board_no") int board_no, RedirectAttributes rttr) {
        boardService.delete(board_no);
        rttr.addFlashAttribute("delete_result", "success");
        rttr.addFlashAttribute("board_no", board_no);

        return "redirect:/board/list";
    }

}
