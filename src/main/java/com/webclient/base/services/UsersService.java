package com.webclient.base.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.webclient.base.domain.User;
import com.webclient.base.repo.UsersRepo;

@Service
public class UsersService implements UserDetailsService 
{	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	
    @Autowired
    private UsersRepo usersRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException 
    {
       User user = usersRepo.findByUsername(username);

       if (user == null) 
       {
         throw new UsernameNotFoundException("Такого пользователя не существует");
       }

       return user;
    }
    
    public List<User> findAll() 
    {
        return usersRepo.findAll();
    }
    
    public boolean saveUser(User user) 
    {
    	User userFromDb = usersRepo.findByUsername(user.getUsername());

        if (userFromDb != null) 
        {
            return false;
        }
    	
    	user.setActive(true);
        user.setDesc_active(false);
		user.setWeb_active(false);
		user.setPhone_active(false);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setRole("ADMIN");
        usersRepo.save(user);
        return true;
    }
}