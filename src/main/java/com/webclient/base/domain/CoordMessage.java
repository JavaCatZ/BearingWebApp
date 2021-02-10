package com.webclient.base.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "coord_packets")
public class CoordMessage implements Message, Serializable
{
	private static final long serialVersionUID = -6549925896972900896L;
	@Id
    private int id;
    private int id_sender;
	private String sender_role;
    private String id_packet;
    private String vessel_info;
    private String latitude;
    private String longitude;
    private String date_time;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_sender() {
		return id_sender;
	}
	public void setId_sender(int id_sender) {
		this.id_sender = id_sender;
	}
	public String getSender_role() {
		return sender_role;
	}
	public void setSender_role(String sender_role) {
		this.sender_role = sender_role;
	}
	public String getId_packet() {
		return id_packet;
	}
	public void setId_packet(String id_packet) {
		this.id_packet = id_packet;
	}
	public String getVessel_info() {
		return vessel_info;
	}
	public void setVessel_info(String vessel_info) {
		this.vessel_info = vessel_info;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
}