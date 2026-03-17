package com.dreamhome.portal.repository;

import com.dreamhome.portal.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Long> {

    // A more flexible search that ignores case and extra spaces
    List<Property> findTop3ByAreaNameContainingIgnoreCaseAndIdNot(String areaName, Long id);

    // Fallback: If no properties in the same area, find by Property Type
    List<Property> findTop3ByPropertyTypeAndIdNot(String propertyType, Long id);
}