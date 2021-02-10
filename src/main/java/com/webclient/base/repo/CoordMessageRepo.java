package com.webclient.base.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webclient.base.domain.CoordMessage;

public interface CoordMessageRepo extends JpaRepository<CoordMessage, String>
{
	Page<CoordMessage> findAll(Pageable pageable);
	
	@Query("select coordMsg from CoordMessage coordMsg  where coordMsg.id_packet = :id_packet")
	CoordMessage findById_packet(@Param("id_packet") String id_packet);
}