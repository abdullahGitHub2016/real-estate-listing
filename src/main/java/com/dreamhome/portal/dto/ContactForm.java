package com.dreamhome.portal.dto;

import lombok.Data;

@Data
public class ContactForm {
    private String firstName;
    private String lastName;
    private String email;
    private String message;
}