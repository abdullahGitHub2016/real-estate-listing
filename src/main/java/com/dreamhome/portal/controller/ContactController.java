package com.dreamhome.portal.controller;

import com.dreamhome.portal.dto.ContactForm;
import com.dreamhome.portal.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    private ContactService contactService;

    @GetMapping
    public String showContactPage(Model model) {
        model.addAttribute("contactForm", new ContactForm());
        return "contact";
    }

    @PostMapping("/send")
    public String sendContact(@ModelAttribute("contactForm") ContactForm form) {
        contactService.saveContactMessage(form);
        return "redirect:/contact?success";
    }
}