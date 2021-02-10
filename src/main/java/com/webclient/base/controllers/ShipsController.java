package com.webclient.base.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webclient.base.domain.Ship;
import com.webclient.base.repo.ShipsRepo;

//import base_lib.ServiceInfo;

@Controller
@RequestMapping("/ships")
@PreAuthorize("hasAuthority('ADMIN')")
public class ShipsController 
{
	private final ShipsRepo shipsRepo;
	
	public ShipsController(ShipsRepo shipsRepo)
	{
		this.shipsRepo = shipsRepo;
	}
	
	@GetMapping
	public String getAllShips(Model model)
	{
		Iterable<Ship> ships = shipsRepo.findAll();
		model.addAttribute("resURL", "http://h136894.s26.test-hf.su/images/");
		model.addAttribute("ships", ships);
	
		return "ships";
	}
	
	@GetMapping("{shipId}")
	public String deleteShip(@PathVariable String shipId)
	{
		
		return "ships";
	}
}