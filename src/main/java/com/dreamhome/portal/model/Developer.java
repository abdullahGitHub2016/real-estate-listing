package com.dreamhome.portal.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "developers")
@Data // This generates getDeveloperName()
public class Developer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private boolean isVerified;
    private String membershipType; // Ensure the spelling matches exactly

    // Is this named developerName or devName?
    // It should match what you use in HTML.
    private String developerName;

    private String logoUrl;

    // Manually add this to satisfy the "Property or field 'isVerified' not found" error
    public boolean getIsVerified() {
        return this.isVerified;
    }
}