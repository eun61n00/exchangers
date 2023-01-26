package com.snut.cse.exchangers.exception;

import lombok.extern.log4j.Log4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j
public class CommonController {

    @GetMapping("/access-error")
    public String accessDenied(Authentication auth, Model model) {
        log.info("Access Denied: " + auth);
        model.addAttribute("msg", "Access Denied");

        return "exception/access_error";
    }

}
