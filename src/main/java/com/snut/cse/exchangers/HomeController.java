package com.snut.cse.exchangers;

import com.snut.cse.exchangers.user.domain.KakaoUserDTO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Log4j
@Controller
public class HomeController {

    @Setter(onMethod_ = {@Autowired})
    private HttpSession session;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/home")
    public String home(KakaoUserDTO kakaoUserDTO, Model model) {
        log.info(session.getAttribute("userEmail"));

        if (session.getAttribute("userEmail") != null) {
            return "/home";
        }
        else {
            return "index";
        }

    }

}
