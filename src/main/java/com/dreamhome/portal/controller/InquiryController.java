package com.dreamhome.portal.controller;

import com.dreamhome.portal.model.Inquiry;
import com.dreamhome.portal.repository.CityRepository;
import com.dreamhome.portal.repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

    @Autowired
    private CityRepository cityRepository;

    @Autowired
    private InquiryRepository inquiryRepository;

    @GetMapping

    public String showInquiryPage(Model model) {
        model.addAttribute("cities", cityRepository.findAll());
        model.addAttribute("inquiry", new Inquiry());
        return "inquiry";
    }

    @PostMapping("/save")
    public String saveInquiry(@ModelAttribute("inquiry") Inquiry inquiry) {
        inquiryRepository.save(inquiry);
        // Redirect with success parameter to show the notification
        return "redirect:/inquiry?success=true";
    }
}