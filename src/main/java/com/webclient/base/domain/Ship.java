package com.webclient.base.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ships")
public class Ship 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	
	private String id_num;
    private String name;
    private String flag;
    private int year;
    private String length;
    private String width;
    private String height;
    private String disp;
    private String speed;
    private String crew;
    private String photo;
    
	public Long getId() 
	{
		return id;
	}
	
	public void setId(Long id) 
	{
		this.id = id;
	}
	
	public String getId_num() 
	{
		return id_num;
	}
	
	public void setId_num(String id_num) 
	{
		this.id_num = id_num;
	}
	
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getFlag() 
	{
		return flag;
	}
	
	public void setFlag(String flag) 
	{
		this.flag = flag;
	}
	
	public int getYear() 
	{
		return year;
	}
	
	public void setYear(int year) 
	{
		this.year = year;
	}
	
	public String getLength() 
	{
		return length;
	}
	
	public void setLength(String length) 
	{
		this.length = length;
	}
	
	public String getWidth()
	{
		return width;
	}
	
	public void setWidth(String width)
	{
		this.width = width;
	}
	
	public String getHeight() 
	{
		return height;
	}
	public void setHeight(String height)
	{
		this.height = height;
	}
	
	public String getDisp()
	{
		return disp;
	}
	
	public void setDisp(String disp) 
	{
		this.disp = disp;
	}
	
	public String getSpeed() 
	{
		return speed;
	}
	
	public void setSpeed(String speed) 
	{
		this.speed = speed;
	}
	
	public String getCrew() 
	{
		return crew;
	}
	
	public void setCrew(String crew) 
	{
		this.crew = crew;
	}
	
	public String getPhoto() 
	{
		return photo;
	}
	
	public void setPhoto(String photo) 
	{
		this.photo = photo;
	}
}