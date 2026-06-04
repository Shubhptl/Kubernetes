package com.example.zerotrust;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class BackendController {

    private final String version;

    public BackendController(@Value("${app.version:v1}") String version) {
        this.version = version;
    }

    @GetMapping("/message")
    public ApiResponse message() {
        return new ApiResponse("Hello from Backend API " + version, version, "healthy");
    }

    @GetMapping("/health")
    public ApiResponse health() {
        return new ApiResponse("Backend API is healthy", version, "healthy");
    }

    @GetMapping("/version")
    public Map<String, String> version() {
        return Map.of("version", version);
    }
}

