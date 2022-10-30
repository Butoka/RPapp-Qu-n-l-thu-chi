package com.RPapp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.RPapp.entity.Roles;
import com.RPapp.util.JpaUtils;

public class RolesDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	
	public Roles create(Roles entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public Roles update(Roles entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public Roles remove(String id) {
		Roles entity = this.findById(id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public Roles findById(String id) {
		Roles entity = em.find(Roles.class, id);
		return entity;
	}
	public List<Roles> findAll() {
		String jsql = "FROM Roles";
		TypedQuery<Roles> query = em.createQuery(jsql,Roles.class);
		List<Roles> list = query.getResultList();
		return list;
	}
}
