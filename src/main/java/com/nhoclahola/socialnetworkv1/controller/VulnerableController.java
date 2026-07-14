package com.nhoclahola.socialnetworkv1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/test/vulnerability")
public class VulnerableController {

    @Autowired
    private JdbcTemplate jdbcTemplate; // Giả sử bạn đang dùng JdbcTemplate

    // Phương thức này có lỗ hổng SQL Injection nghiêm trọng
    @GetMapping("/login")
    public List<Map<String, Object>> vulnerableLogin(
            @RequestParam String username,
            @RequestParam String password) {

        // ĐÂY LÀ DÒNG CODE CÓ LỖ HỔNG SQL INJECTION
        // Nó nối trực tiếp chuỗi đầu vào của người dùng vào câu lệnh SQL.
        // SonarQube được lập trình để tìm chính xác những mẫu như thế này.
        String sql = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";

        System.out.println("Executing vulnerable query: " + sql);

        return jdbcTemplate.queryForList(sql);
    }
}
