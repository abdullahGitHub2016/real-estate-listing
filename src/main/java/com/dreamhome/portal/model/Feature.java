package com.dreamhome.portal.model;

import jakarta.persistence.*;
import lombok.Getter;

@Entity
@Table(name = "features")
public class Feature {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Getters and Setters
    @Getter
    @Column(name = "feature_name")
    private String featureName;

}