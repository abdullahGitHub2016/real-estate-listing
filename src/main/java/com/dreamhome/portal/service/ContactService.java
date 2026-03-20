package com.dreamhome.portal.service;

import com.dreamhome.portal.dto.ContactForm;
import com.dreamhome.portal.model.ContactMessage;
import com.dreamhome.portal.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService {

    @Autowired
    private ContactRepository contactRepository;

    public void saveContactMessage(ContactForm form) {
        ContactMessage msg = new ContactMessage();
        msg.setFirstName(form.getFirstName());
        msg.setLastName(form.getLastName());
        msg.setEmail(form.getEmail());
        msg.setMessage(form.getMessage());
        contactRepository.save(msg);
    }
}