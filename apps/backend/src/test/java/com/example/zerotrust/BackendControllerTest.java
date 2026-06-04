package com.example.zerotrust;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(BackendController.class)
class BackendControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void returnsMessage() throws Exception {
        mockMvc.perform(get("/api/message"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message", is("Hello from Backend API v1")))
                .andExpect(jsonPath("$.version", is("v1")))
                .andExpect(jsonPath("$.status", is("healthy")));
    }
}

