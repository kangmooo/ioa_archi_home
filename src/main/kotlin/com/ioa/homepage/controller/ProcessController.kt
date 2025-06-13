package com.ioa.homepage.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

@Controller
@RequestMapping("/process")
class ProcessController {

    @GetMapping
    fun home(model: Model): String {
        model.addAttribute("contentTemplate", "process")
        model.addAttribute("title", "process - IOA Architecture")
        return "layout"
    }
}
