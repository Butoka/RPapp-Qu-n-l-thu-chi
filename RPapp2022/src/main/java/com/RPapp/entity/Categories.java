package com.RPapp.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Categories {
	@Id
	@Column(name = "[id]")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	
	@Column(name = "pays")
	private Boolean pay;
	
	@OneToMany(mappedBy = "category")
	private List<Pays> payList;
	
	@OneToMany(mappedBy = "category")
	private List<Receives> recList;

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

	public Boolean getPay() {
		return pay;
	}

	public void setPay(Boolean pay) {
		this.pay = pay;
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
		return "Categories [id=" + id + ", name=" + name + ", pay=" + pay + ", payList=" + payList + ", recList="
				+ recList + "]";
	}
	
	
}
