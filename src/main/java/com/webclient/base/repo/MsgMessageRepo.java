package com.webclient.base.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.webclient.base.domain.MsgMessage;

public interface MsgMessageRepo extends JpaRepository<MsgMessage, String>
{
	Page<MsgMessage> findAll(Pageable pageable);
	
	@Query("select msgMsg from MsgMessage msgMsg  where msgMsg.id_packet = :id_packet")
	MsgMessage findById_packet(@Param("id_packet") String id_packet);
}