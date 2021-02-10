package com.webclient.base.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webclient.base.domain.User;
import com.webclient.base.repo.UsersRepo;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UsersController 
{
	private final UsersRepo usersRepo;
	
	public UsersController(UsersRepo usersRepo)
	{
	    this.usersRepo = usersRepo;
	}

	@GetMapping
	public String getUsers(Model model)
	{
		Iterable<User> users = usersRepo.findAll();
		model.addAttribute("users", users);
	
		return "users";
	}
	
	@GetMapping("{operationType}/{username}")
	public String modifUser(@PathVariable String operationType, @PathVariable String username, Model model)
	{
		User user = usersRepo.findByUsername(username);
		
		switch(operationType)
		{
			case "edit":
				model.addAttribute("user", user);
			return "edit";
			
			case "block":
				if(user.getActive())
				{
					user.setActive(false);
				}
					else
					{
						user.setActive(true);
					}
				
				usersRepo.save(user);
			break;
				
			case "delete":
				model.addAttribute("userId", user.getId_employee());
				usersRepo.delete(user);
			break;
		}
		
		Iterable<User> users = usersRepo.findAll();
		model.addAttribute("users", users);
		return "users";
	}
}