package com.webclient.base.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "employees")
public class User implements UserDetails
{	
	private static final long serialVersionUID = 4542589904425056580L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	
	@NotBlank(message="Поле логина не должно быть пустым")
	@Length(max=20, message="Максимальное количество символов: 20")
    private String username;
	@NotBlank(message="Поле пароля не должно быть пустым")
    private String password;
    private boolean active;
    private boolean desc_active;
    private boolean web_active;
    private boolean phone_active;
    @NotBlank(message="Поле id не должно быть пустым")
	@Length(max=6, message="Максимальное количество символов: 6")
    private String id_employee;
    private String role;
    
    public boolean isAdmin() 
    {
        return role.equals("ADMIN");
    }
    
    public Long getId() 
    {
		return id;
	}
    
	public void setId(Long id) 
	{
		this.id = id;
	}
	
	public String getUsername()
	{
		return username;
	}
	
	public void setUsername(String username) 
	{
		this.username = username;
	}
	
	public String getPassword() 
	{
		return password;
	}
	
	public void setPassword(String password) 
	{
		this.password = password;
	}
	
	public boolean getActive() 
	{
		return active;
	}
	
	public void setActive(boolean active) 
	{
		this.active = active;
	}
	
	public boolean isDesc_active() 
	{
		return desc_active;
	}

	public void setDesc_active(boolean desc_active) 
	{
		this.desc_active = desc_active;
	}

	public boolean isWeb_active() 
	{
		return web_active;
	}

	public void setWeb_active(boolean web_active) 
	{
		this.web_active = web_active;
	}

	public boolean isPhone_active() 
	{
		return phone_active;
	}

	public void setPhone_active(boolean phone_active) 
	{
		this.phone_active = phone_active;
	}
	
	public String getId_employee() 
	{
		return id_employee;
	}
	
	public void setId_employee(String id_employee) 
	{
		this.id_employee = id_employee;
	}
	
	public String getRole() 
	{
		return role;
	}
	
	public void setRole(String role) 
	{
		this.role = role;
	}
	
	@Override
	public Set<GrantedAuthority> getAuthorities() 
	{
	   Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
	   authorities.add(new SimpleGrantedAuthority(this.role));
	   return authorities;
	}
	
	@Override
	public boolean isAccountNonExpired() 
	{
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() 
	{
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() 
	{
		return true;
	}
	
	@Override
	public boolean isEnabled() 
	{
		return getActive();
	}
}