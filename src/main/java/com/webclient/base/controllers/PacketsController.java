package com.webclient.base.controllers;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webclient.base.domain.CoordMessage;
import com.webclient.base.domain.FullMessage;
import com.webclient.base.domain.MsgMessage;
import com.webclient.base.repo.CoordMessageRepo;
import com.webclient.base.repo.FullMessageRepo;
import com.webclient.base.repo.MsgMessageRepo;

//import base_lib.ServiceInfo;

@Controller
@RequestMapping("/packages")
@PreAuthorize("hasAuthority('ADMIN')")
public class PacketsController 
{	
	private final MsgMessageRepo msgMessageRepo;
	private final CoordMessageRepo coordMessageRepo;
	private final FullMessageRepo fullMessageRepo;
		
	public PacketsController(MsgMessageRepo msgMessageRepo, CoordMessageRepo coordMessageRepo, FullMessageRepo fullMessageRepo)
	{
		this.msgMessageRepo = msgMessageRepo;
		this.coordMessageRepo = coordMessageRepo;
		this.fullMessageRepo = fullMessageRepo;
	}
	
	@GetMapping
	public String getFirstPackets(Model model, @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable)
	{
		Page<CoordMessage> coordMessages = coordMessageRepo.findAll(pageable);
		model.addAttribute("page", coordMessages);
		model.addAttribute("url", "/packages/coords");
		model.addAttribute("messageType", "coords");
		return "packages";
	}
	

	@GetMapping("{packetType}")
	public String getPackets(@PathVariable String packetType, Model model,  @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable)
	{
		switch(packetType)
		{
			case "coords":
				Page<CoordMessage> coordMessages = coordMessageRepo.findAll(pageable);
				model.addAttribute("page", coordMessages);
				model.addAttribute("url", "/packages/" + packetType);
				model.addAttribute("messageType", "coords");
			break;
			
			case "messages":
				Page<MsgMessage> msgMessages= msgMessageRepo.findAll(pageable);
				model.addAttribute("page", msgMessages);
				model.addAttribute("url", "/packages/" + packetType);
				model.addAttribute("messageType", "messages");
			break;
				
			case "fulls":
				Page<FullMessage> fullMessages = fullMessageRepo.findAll(pageable);
				model.addAttribute("resURL", "http://h136894.s26.test-hf.su/images/");
				model.addAttribute("page", fullMessages);
				model.addAttribute("url", "/packages/" + packetType);
				model.addAttribute("messageType", "fulls");
			break;
		}

		return "packages";
	}
	
	@GetMapping("{packetType}/{operationType}/{id_packet}")
	public String showPacket(@PathVariable String packetType, @PathVariable String operationType, @PathVariable String id_packet, Model model, @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable)
	{
		switch(packetType)
		{
			case "coords":
				CoordMessage coordsPacket = coordMessageRepo.findById_packet(id_packet);
				
				switch(operationType)
				{				
				   case "delete":
					  model.addAttribute("packetId", id_packet);
					  model.addAttribute("messageType", "coords");
					  coordMessageRepo.delete(coordsPacket);
					  Page<CoordMessage> coordMessages = coordMessageRepo.findAll(pageable);
					  model.addAttribute("page", coordMessages);
					  model.addAttribute("url", "/packages/" + packetType);
					  return "/packages";
				}
				
			break;
		
			case "messages":
				MsgMessage messagePacket = msgMessageRepo.findById_packet(id_packet);
				
				switch(operationType)
				{
				   case "view":
				      model.addAttribute("resURL", "http://h136894.s26.test-hf.su/images/");
					  model.addAttribute("message", messagePacket);
					  model.addAttribute("messageType", packetType);
					  return "packageShow";
						
				   case "delete":
					  model.addAttribute("packetId", id_packet);
					  model.addAttribute("messageType", "messages");
					  msgMessageRepo.delete(messagePacket);
					  Page<MsgMessage> msgMessages= msgMessageRepo.findAll(pageable);
					  model.addAttribute("page", msgMessages);
					  model.addAttribute("url", "/packages/" + packetType);
					  return "/packages";
				}
				
			break;
			
			case "fulls":
				FullMessage fullPacket = fullMessageRepo.findById_packet(id_packet);
				
				switch(operationType)
				{
				   case "view":
				      model.addAttribute("resURL", "http://h136894.s26.test-hf.su/images/");
					  model.addAttribute("message", fullPacket);
					  model.addAttribute("messageType", packetType);
					  return "packageShow";
						
				   case "delete":
					  model.addAttribute("packetId", id_packet);
					  model.addAttribute("messageType", "fulls");
					  fullMessageRepo.delete(fullPacket);
					  Page<FullMessage> fullMessages = fullMessageRepo.findAll(pageable);
					  model.addAttribute("resURL", "http://h136894.s26.test-hf.su/images/");
					  model.addAttribute("page", fullMessages);
					  model.addAttribute("url", "/packages/" + packetType);
					  return "/packages";
				}
				
			break;
		}

		return "packages";
	}
}