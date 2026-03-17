package com.dreamhome.portal.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Entity
@Table(name = "cities")
@Data
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "city_name", nullable = false, unique = true)
    private String cityName;

    // Optional: Link back to properties in this city
    // "city" here must match the variable name in Property.java
    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
    private List<Property> properties;
}