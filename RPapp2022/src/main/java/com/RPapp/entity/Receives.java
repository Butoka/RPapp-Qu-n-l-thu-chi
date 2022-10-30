package com.RPapp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Receives {
	@Id
	@Column(name = "[id]")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	
	private Double money;
	
	@Temporal(TemporalType.DATE)
	private Date createdate = new Date();
	
	@ManyToOne
	@JoinColumn(name = "category")
	private Categories category;
	
	@ManyToOne
	@JoinColumn(name = "createuser")
	private Accounts account;
	
	@Column(name = "levels")
	private Boolean levels;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Categories getCategory() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}

	public Accounts getAccount() {
		return account;
	}

	public void setAccount(Accounts account) {
		this.account = account;
	}

	public Boolean getLevels() {
		return levels;
	}

	public void setLevels(Boolean levels) {
		this.levels = levels;
	}

	@Override
	public String toString() {
		return "Receives [id=" + id + ", name=" + name + ", money=" + money + ", createdate=" + createdate
				+ ", category=" + category + ", account=" + account + ", levels=" + levels + "]";
	}
	
	
}
