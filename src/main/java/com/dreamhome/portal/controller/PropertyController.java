package com.dreamhome.portal.controller;

import com.dreamhome.portal.model.Property;
import com.dreamhome.portal.repository.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PropertyController {

    @Autowired
    private PropertyRepository propertyRepository;

    // This method handles the request for the home page (http://localhost:8080/)
    @GetMapping("/")
    public String listProperties(Model model) {
        // Fetch all listings from your SQL database
        model.addAttribute("properties", propertyRepository.findAll());

        // This returns the name of your HTML file: src/main/resources/templates/index.html
        return "index";
    }

    @GetMapping("/property/{id}")
    public String showPropertyDetails(@PathVariable("id") Long id, Model model) {
        Property property = propertyRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        // Handle "Similar Properties" safely
        List<Property> similar = propertyRepository.findTop4ByAreaNameAndIdNot(property.getAreaName(), id);
        if (similar == null) similar = new ArrayList<>();

        model.addAttribute("property", property);
        model.addAttribute("similarProperties", similar);

        return "property-details";
    }
}