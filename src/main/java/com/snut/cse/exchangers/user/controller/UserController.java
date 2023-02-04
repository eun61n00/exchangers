package com.snut.cse.exchangers.user.controller;

import com.snut.cse.exchangers.user.domain.UserDTO;
import com.snut.cse.exchangers.user.service.UserService;
import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Setter(onMethod_ = {@Autowired})
    private HttpSession session;

    @Setter(onMethod_ = {@Autowired})
    private UserService userService;

    @GetMapping("/login")
    public void login(String error, String logout, Model model) {
        log.info("===== login page =====");
        log.info("error: " + error);
        log.info("logout: " + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error - Check your Account!");
        }

        if (logout != null) {
            model.addAttribute("logout", "Logout!");
        }

    }

    @PostMapping("/login")
    public String login(UserDTO userDTO, Model model) {
        log.info("===== logged in =====");
        if (userService.getUserInfo(userDTO.getEmail()) == null) {
            return "sign_up";
        }
        else {
            return "home";
        }
    }

    @GetMapping("/logout")
    public String logout() {
        log.info("===== logout =====");
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/kakao-login")
    public String kakaoLogin(KakaoUserDTO kakaoUserDTO, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) {
        log.info(kakaoUserDTO);

        if (userService.getKakaoUserInfo(kakaoUserDTO.getEmail()) == null) {
            userService.insertKakaoUserInfo(kakaoUserDTO);
        }

        session.invalidate();
        session.setAttribute("userEmail", kakaoUserDTO.getEmail());
        session.setAttribute("userName", kakaoUserDTO.getName());

        rttr.addFlashAttribute("kakaoUserDTO", kakaoUserDTO);

        return "redirect:/home";

    }

    @GetMapping("/mypage")
    public void myPage() {
    }

}
