package com.snut.cse.exchangers;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Log4j
@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/home")
    public String home(Model model) {

//        if (session.getAttribute("kakaoEmail") != null) {
//            model.addAttribute("kakaoEmail", session.getAttribute("kakaoEmail"));
//            model.addAttribute("kakaoName", session.getAttribute("kakaoName"));
//
//            return "home";
//        }
//
//        else {
//            return "index";
//        }

        return "index";

    }

}
