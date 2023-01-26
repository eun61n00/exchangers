package com.snut.cse.exchangers.user.controller;

import com.snut.cse.exchangers.user.service.UserService;
import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Setter(onMethod_ = {@Autowired})
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

    @GetMapping("/kakao-login")
    public String kakaoLogin(@RequestParam(value="code", required = false) String code) {
        log.info("===== login (code: " + code +") =====");

        String accessToken = userService.getAccessToken(code);

        KakaoUserDTO kakaoUserDTO = userService.getUserInfo(accessToken);

        return "testpage";
    }

}
