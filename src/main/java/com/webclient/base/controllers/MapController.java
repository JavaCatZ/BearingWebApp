package com.webclient.base.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class MapController 
{
	@GetMapping("/map")
	public String getGreeting()
	{
		return "map";
	}
}