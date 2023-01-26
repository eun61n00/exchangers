package com.snut.cse.exchangers;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j
@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "home";
    }

}
