package com.dreamhome.portal.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.*;

@Entity
@Table(name = "properties")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Property {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String areaName;
    private String description;
    private Integer beds;
    private Integer baths;
    private Integer sizeSqft;
    private String purpose;
    private String propertyType;

    @ManyToOne(fetch = FetchType.EAGER) // Change to EAGER to fix the "Proxy" error immediately
    @JoinColumn(name = "developer_id")
    private Developer developer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "city_id")
    private City city;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "property_features",
            joinColumns = @JoinColumn(name = "property_id"),
            inverseJoinColumns = @JoinColumn(name = "feature_id")
    )
    private List<Feature> features;

    @Column(name = "price_total") // Ensure this matches your MySQL column name
    private Double priceTotal;
}