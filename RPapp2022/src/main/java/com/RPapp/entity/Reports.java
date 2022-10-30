package com.RPapp.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "Report.spFavoriteByYear", procedureName = "spFavoriteByYear", resultClasses = {
				Reports.class }, parameters = @StoredProcedureParameter(name = "year", type = Integer.class)) })
public class Reports implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	String group;
	Long likes;
	Date newest;
	Date oldest;

	public Reports() {
	}

	public Reports(String group, Long likes, Date newest, Date oldest) {
		this.group = group;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public Long getLikes() {
		return likes;
	}

	public void setLikes(Long likes) {
		this.likes = likes;
	}

	public Date getNewest() {
		return newest;
	}

	public void setNewest(Date newest) {
		this.newest = newest;
	}

	public Date getOldest() {
		return oldest;
	}

	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}

	@Override
	public String toString() {
		return "Report [group=" + group + ", likes=" + likes + ", newest=" + newest + ", oldest=" + oldest + "]";
	}

}
