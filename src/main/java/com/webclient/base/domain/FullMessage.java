package com.webclient.base.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "full_packets")
public class FullMessage implements Message, Serializable
{
	private static final long serialVersionUID = 504701355702128853L;
	@Id
    private int id;
    private int id_sender;
	private String sender_role;
	private String vessel_info;
    private String id_packet;
    private String latitude;
    private String longitude;
    private String packet_cat;
    private String packet_theme;
    private String packet_desc;
    private String[] packet_images;
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
	public String getVessel_info() {
		return vessel_info;
	}
	public void setVessel_info(String vessel_info) {
		this.vessel_info = vessel_info;
	}
	public String getId_packet() {
		return id_packet;
	}
	public void setId_packet(String id_packet) {
		this.id_packet = id_packet;
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
	public String getPacket_cat() {
		return packet_cat;
	}
	public void setPacket_cat(String packet_cat) {
		this.packet_cat = packet_cat;
	}
	public String getPacket_theme() {
		return packet_theme;
	}
	public void setPacket_theme(String packet_theme) {
		this.packet_theme = packet_theme;
	}
	public String getPacket_desc() {
		return packet_desc;
	}
	public void setPacket_desc(String packet_desc) {
		this.packet_desc = packet_desc;
	}
	public String[] getPacket_images() {
		return packet_images;
	}
	public void setPacket_images(String[] packet_images) {
		this.packet_images = packet_images;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
}