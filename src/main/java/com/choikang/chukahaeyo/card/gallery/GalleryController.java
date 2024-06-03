package com.choikang.chukahaeyo.card.gallery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GalleryController {
    @GetMapping("/gallery")
    public String gallery() {
        return "card/gallery";
    }
}
