package com.webclient.base.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.webclient.base.domain.User;
import com.webclient.base.repo.UsersRepo;

@Controller
public class EditController 
{
	@Autowired
    private UsersRepo userRepo;
	
	public EditController(UsersRepo userRepo)
	{
		this.userRepo = userRepo;
	}
	
	@GetMapping("/edit")
	public String getRegistration()
	{
		return "edit";
	}
	
	@PostMapping("/edit/{userid}/{username}/{admin}")
	public String postRegistration(@PathVariable String userid, @PathVariable String username, @PathVariable String admin, User user, Map<String, Object> model)
	{
        User userFromDb = userRepo.findById_employee(user.getId_employee());
        if (userFromDb != null) 
        {
           if(!userid.equals(userFromDb.getId_employee()))
           {
        	   model.put("message", "Изменённый id пользователя совпадает с уже имеющимся в базе");
        	   return "edit"; 
           }
        }
        
        userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) 
        {
           if(!username.equals(user.getUsername()))
           {
        	   model.put("message", "Изменённый логин пользователя совпадает с уже имеющимся в базе");
        	   return "edit"; 
           }
        }
        
        userFromDb = userRepo.findByUsername(userid);
			if(user.isDesc_active() || user.isPhone_active() || user.isWeb_active())
			{
				model.put("message", "Внесение изменений невозможно, так как пользователь уже авторизован");
				return "edit";
			}
				else
				{
					if(admin.equals("admin"))
	        		{
						userFromDb.setRole("ADMIN");
	        		}
	                	else
	                	{
	                		userFromDb.setRole("USER");
	                	}
	                
	        		return "redirect:/users";
				}       		
	}
}