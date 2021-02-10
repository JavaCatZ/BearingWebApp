package com.webclient.base.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webclient.base.domain.FullMessage;

public interface FullMessageRepo extends JpaRepository<FullMessage, String>
{
	Page<FullMessage> findAll(Pageable pageable);
	
	@Query("select fMsg from FullMessage fMsg  where fMsg.id_packet = :id_packet")
	FullMessage findById_packet(@Param("id_packet") String id_packet);
}