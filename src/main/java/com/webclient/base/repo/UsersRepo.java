package com.webclient.base.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webclient.base.domain.User;

public interface UsersRepo extends JpaRepository<User, String>
{
	User findByUsername(String username);
	
	@Query("select user from User user  where user.id_employee = :id_employee")
	User findById_employee(@Param("id_employee") String id_employee);
}
