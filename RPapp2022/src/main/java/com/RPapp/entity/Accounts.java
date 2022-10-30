package com.RPapp.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Accounts {
	
	@Id
	@Column(name = "[username]")
	private String username;
	
	@Column(name = "[password]")
	private String password;
	
	private String fullname;
	
	private Boolean gender;
	
	private String email;
	
	private Boolean active;
	
	@ManyToOne
	@JoinColumn(name = "[role]")
	private Roles role;
	
	@OneToMany(mappedBy = "account")
	private List<Pays> payList;
	
	@OneToMany(mappedBy = "account")
	private List<Receives> recList;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	public List<Pays> getPayList() {
		return payList;
	}

	public void setPayList(List<Pays> payList) {
		this.payList = payList;
	}

	public List<Receives> getRecList() {
		return recList;
	}

	public void setRecList(List<Receives> recList) {
		this.recList = recList;
	}

	@Override
	public String toString() {
		return "Accounts [username=" + username + ", password=" + password + ", fullname=" + fullname + ", gender="
				+ gender + ", email=" + email + ", active=" + active + ", role=" + role + ", payList=" + payList
				+ ", recList=" + recList + "]";
	}

	public Accounts(String username, String password, String fullname, Boolean gender, String email, Boolean active,
			Roles role) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.gender = gender;
		this.email = email;
		this.active = active;
		this.role = role;
	}

	public Accounts() {
		super();
	}
	
	

	
}
