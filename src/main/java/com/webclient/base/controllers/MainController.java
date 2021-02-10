package com.webclient.base.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MainController 
{
	public MainController()
	{}

	@GetMapping("/")
	public String getGreeting()
	{
		return "greeting";
	}
	
	@GetMapping("/greeting")
	public String getNewGreeting()
	{
		return "greeting";
	}
	
}