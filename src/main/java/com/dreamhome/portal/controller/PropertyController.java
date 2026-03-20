package com.dreamhome.portal.controller;

import com.dreamhome.portal.model.Property;
import com.dreamhome.portal.repository.CityRepository;
import com.dreamhome.portal.repository.PropertyRepository;
import com.dreamhome.portal.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Controller
public class PropertyController {

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private CityRepository cityRepository;

    @GetMapping("/properties/{type}")
    public String getPropertiesByType(
            @PathVariable String type,
            @RequestParam(required = false) Integer cityId,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) Integer beds,
            Model model) {

        // 1. Map the URL path to the database 'purpose' value
        String purpose = switch (type) {
            case "to-rent" -> "rent";
            case "for-sale" -> "sale";
            case "commercial" -> "commercial";
            case "land" -> "land";
            default -> null;
        };

        // 2. FIX: Call 'searchProperties' (the actual method name in your Service)
        List<Property> properties = propertyService.searchProperties(purpose, cityId, maxPrice, beds);

        model.addAttribute("properties", properties);
        model.addAttribute("selectedType", type);

        return "listings";
    }

    /*
    @GetMapping("/properties/to-rent")
    public String listRentals(
            @RequestParam(required = false) Integer cityId,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) Integer beds,
            Model model) {

        // Hardcode purpose to 'rent' for this route
        model.addAttribute("properties", propertyService.searchProperties("rent", cityId, maxPrice, beds));
        model.addAttribute("cities", cityRepository.findAll());
        return "listings"; // New template for search results
    }


     */

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
    public String showDetails(@PathVariable Long id, Model model) {
        Property property = propertyRepository.findById(id).orElseThrow();

        // 1. Try to find by Area
        List<Property> similar = propertyRepository.findTop3ByAreaNameContainingIgnoreCaseAndIdNot(
                property.getAreaName(), id
        );

        // 2. Fallback: If area is empty, find by Property Type (e.g., other Apartments)
        if (similar.isEmpty()) {
            similar = propertyRepository.findTop3ByPropertyTypeAndIdNot(
                    property.getPropertyType(), id
            );
        }

        model.addAttribute("property", property);
        model.addAttribute("similarProperties", similar);
        return "property-details";
    }
}