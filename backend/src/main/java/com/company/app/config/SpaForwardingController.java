package com.company.app.config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpaForwardingController {

    @GetMapping("/")
    public String forwardHome() {
        return "forward:/index.html";
    }
}
