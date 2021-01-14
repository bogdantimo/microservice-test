package com.example.microservicetest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FrontController {

    @GetMapping("/back")
    public ResponseEntity<String> ping() {
        System.out.println("First Debug from Remote:))");
        return ResponseEntity.ok("I am alive and well, and remote called asd");
    }
}
