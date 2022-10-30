package com.RPapp.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonInclude;

@Entity
public class Roles {
	
	@Id
	@Column(name = "[id]")
	private String id;
	
	private String name;
	
	@JsonInclude
	@OneToMany(mappedBy = "role")
	private List<Accounts> accList;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Accounts> getAccList() {
		return accList;
	}

	public void setAccList(List<Accounts> accList) {
		this.accList = accList;
	}

	@Override
	public String toString() {
		return "Roles [id=" + id + ", name=" + name + ", accList=" + accList + "]";
	}
	
	
}
