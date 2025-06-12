package com.ioa.homepage.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

@Controller
@RequestMapping("/project")
class ProjectsController {

    @GetMapping
    fun home(model: Model): String {
        model.addAttribute("contentTemplate", "projects")
        model.addAttribute("title", "Home - IOA Architecture")
        return "layout"
    }

    @GetMapping("/detail")
    fun projectDetail(@RequestParam id: Long, model: Model): String {
        // id에 해당하는 프로젝트 데이터를 조회
//        val project = projectService.findById(id)  // 예시, 실제 서비스 메서드명 맞게 사용

//        model.addAttribute("project", project)
//        model.addAttribute("title", "${project.title} - IOA Architecture")
        model.addAttribute("title", "Home - IOA Architecture")
        model.addAttribute("contentTemplate", "projectDetail") // 상세 페이지 fragment 이름

        return "layout"
    }
}
