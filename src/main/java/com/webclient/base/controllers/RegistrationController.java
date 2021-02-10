package com.webclient.base.controllers;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.webclient.base.domain.User;
import com.webclient.base.services.UsersService;

@Controller
public class RegistrationController 
{ 	
	 @Autowired
	 private UsersService usersService;
	
	@GetMapping("/registration")
	public String getRegistration()
	{
		return "registration";
	}
	
	@PostMapping("/registration")
	public String postRegistration(@Valid User user, BindingResult bindingResult, Model model)
	{
		if (bindingResult.hasErrors()) 
		{
           Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
           model.mergeAttributes(errors);
           return "registration";
        }

        if (!usersService.saveUser(user)) 
        {
            model.addAttribute("usernameError", "Пользователь с таким логином уже есть");
            return "registration";
        }
        
        return "redirect:/users";
	}
}