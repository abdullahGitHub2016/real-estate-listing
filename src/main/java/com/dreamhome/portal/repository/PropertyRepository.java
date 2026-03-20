package com.dreamhome.portal.repository;

import com.dreamhome.portal.model.Property;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Long> {

    @Query("SELECT p FROM Property p WHERE " +
            "(:purpose IS NULL OR LOWER(p.purpose) LIKE LOWER(CONCAT('%', :purpose, '%'))) AND " +
            "(:cityId IS NULL OR p.city.id = :cityId) AND " +
            "(:maxPrice IS NULL OR p.priceTotal <= :maxPrice) AND " +
            "(:beds IS NULL OR p.beds >= :beds)")
    List<Property> findByFilters(
            @Param("purpose") String purpose,
            @Param("cityId") Integer cityId,
            @Param("maxPrice") Double maxPrice,
            @Param("beds") Integer beds
    );

    // Dynamic suggestions based on area
    List<Property> findTop3ByAreaNameContainingIgnoreCaseAndIdNot(String areaName, Long id);

    // Fallback suggestions based on type
    List<Property> findTop3ByPropertyTypeAndIdNot(String propertyType, Long id);
}