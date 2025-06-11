package com.ioa.homepage.controller

import org.springframework.ui.Model
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class HomeController {

    @GetMapping("/")
    fun home(model: Model): String {
        // 여기에서 동적으로 필요한 데이터를 Model에 추가할 수 있습니다.
        // 예: model.addAttribute("projects", projectService.getAllProjects())
        return "index" // src/main/resources/templates/index.html 파일을 렌더링합니다.
    }

    @GetMapping("/studio")
    fun studio(model: Model): String {
        return "studio" // src/main/resources/templates/studio.html 파일을 렌더링합니다.
    }

    @GetMapping("/contact")
    fun contact(model: Model): String {
        return "contact" // src/main/resources/templates/contact.html 파일을 렌더링합니다.
    }
}