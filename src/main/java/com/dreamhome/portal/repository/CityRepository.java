package com.dreamhome.portal.repository;

import com.dreamhome.portal.model.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends JpaRepository<City, Integer> {
    // You can add a method to find city by name if needed
    City findByCityName(String cityName);
}