package com.snut.cse.exchangers.user.controller;

import com.snut.cse.exchangers.user.service.UserService;
import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import com.snut.cse.exchangers.user.service.UserServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Setter(onMethod_ = {@Autowired})
    private HttpSession session;

    private UserService userService;

    @GetMapping("/login")
    public void login(String error, String logout, Model model) {
        log.info("===== login =====");
        log.info("error: " + error);
        log.info("logout: " + logout);

        if (error != null) {
            model.addAttribute("error", "Login Error - Check your Account!");
        }

        if (logout != null) {
            model.addAttribute("logout", "Logout!");
        }

    }

    @GetMapping("/logout")
    public void logout() {
        log.info("===== logout =====");
    }

    @PostMapping("/kakao-login")
    public String kakaoLogin(KakaoUserDTO kakaoUserDTO, RedirectAttributes rttr, HttpServletResponse response) {
        log.info(kakaoUserDTO);

        if (userService.getUserInfo(kakaoUserDTO.getEmail()) == null) {
            userService.insertUserInfo(kakaoUserDTO);
        }

        session.invalidate();
        session.setAttribute("kakaoEmail", kakaoUserDTO.getEmail());
        session.setAttribute("kakaoName", kakaoUserDTO.getName());

        return "/home";
    }

    @GetMapping("/mypage")
    public void myPage() {
    }

}
