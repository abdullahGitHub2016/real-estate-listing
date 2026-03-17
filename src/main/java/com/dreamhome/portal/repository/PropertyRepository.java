package com.dreamhome.portal.repository;

import com.dreamhome.portal.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Long> {

    // Logic: Find properties in the same area, but exclude the current one
    List<Property> findTop4ByAreaNameAndIdNot(String areaName, Long id);
}