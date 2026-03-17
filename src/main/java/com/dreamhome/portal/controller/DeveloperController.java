package com.dreamhome.portal.controller;

import com.dreamhome.portal.repository.DeveloperRepository;
import com.dreamhome.portal.repository.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DeveloperController {

    @Autowired
    private DeveloperRepository developerRepository;

    @GetMapping("/developers")
    public String showDevelopers(Model model) {
        // This fetches all developers from your SQL table
        model.addAttribute("developers", developerRepository.findAll());
        return "developers"; // refers to developers.html
    }
}