package com.dreamhome.portal.service;

import com.dreamhome.portal.model.Property;
import com.dreamhome.portal.repository.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyService {

    @Autowired
    private PropertyRepository propertyRepository;

    public List<Property> searchProperties(String purpose, Integer cityId, Double maxPrice, Integer beds) {
        System.out.println("--- SEARCH DEBUG ---");
        System.out.println("Purpose: " + purpose);
        System.out.println("City ID: " + cityId);
        System.out.println("Max Price: " + maxPrice);
        System.out.println("Min Beds: " + beds);

        return propertyRepository.findByFilters(purpose, cityId, maxPrice, beds);
    }
}