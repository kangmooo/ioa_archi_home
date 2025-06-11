package com.ioa.homepage

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class HomepageApplication

fun main(args: Array<String>) {
    runApplication<HomepageApplication>(*args)
}
