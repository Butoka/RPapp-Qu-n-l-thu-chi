package com.RPapp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.RPapp.entity.Pays;
import com.RPapp.util.JpaUtils;

public class PaysDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	
	public Pays create(Pays entity) {
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
	public Pays update(Pays entity) {
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
	public Pays remove(Integer id) {
		Pays entity = this.findById(id);
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
	public Pays findById(Integer id) {
		Pays entity = em.find(Pays.class, id);
		return entity;
	}
	public List<Pays> findAll() {
		String jsql = "FROM Pays";
		TypedQuery<Pays> query = em.createQuery(jsql,Pays.class);
		List<Pays> list = query.getResultList();
		return list;
	}
	
	public Double getTotal() {
		String jsql = "SELECT sum(o.money) FROM Pays o";
		TypedQuery<Double> query = em.createQuery(jsql,Double.class);
		return query.getSingleResult();
	}
}
