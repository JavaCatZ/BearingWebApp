package com.webclient.base.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webclient.base.domain.Ship;

public interface ShipsRepo extends JpaRepository<Ship, String>
{

}