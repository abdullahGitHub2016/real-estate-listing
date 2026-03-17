package com.dreamhome.portal.repository;

import com.dreamhome.portal.model.Developer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeveloperRepository extends JpaRepository<Developer, Integer> {
    // This connects to your 'developers' table in the SQL dump
}