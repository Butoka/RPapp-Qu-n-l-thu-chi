package com.RPapp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.RPapp.entity.Receives;
import com.RPapp.util.JpaUtils;

public class ReceivesDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	public Receives create(Receives entity) {
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

	public Receives update(Receives entity) {
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

	public Receives remove(Integer id) {
		Receives entity = this.findById(id);
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

	public Receives findById(Integer id) {
		Receives entity = em.find(Receives.class, id);
		return entity;
	}

	public List<Receives> findAll() {
		String jsql = "FROM Receives";
		TypedQuery<Receives> query = em.createQuery(jsql, Receives.class);
		List<Receives> list = query.getResultList();
		return list;
	}
	
	public Double getTotal() {
		String jsql = "SELECT sum(o.money) FROM Receives o";
		TypedQuery<Double> query = em.createQuery(jsql,Double.class);
		return query.getSingleResult();
	}
}
