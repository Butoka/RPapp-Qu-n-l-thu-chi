package com.RPapp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.RPapp.entity.Accounts;
import com.RPapp.entity.Categories;
import com.RPapp.util.JpaUtils;

public class AccountsDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	
	public Accounts create(Accounts entity) {
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
	public Accounts update(Accounts entity) {
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
	public Accounts remove(String id) {
		Accounts entity = this.findById(id);
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
	public Accounts findById(String id) {
		Accounts entity = em.find(Accounts.class, id);
		return entity;
	}
	public List<Accounts> findAll() {
		String jsql = "FROM Accounts";
		TypedQuery<Accounts> query = em.createQuery(jsql,Accounts.class);
		List<Accounts> list = query.getResultList();
		return list;
	}
	
	public List<Accounts> findEmail(String email) {
		String jsql = "SELECT o FROM Accounts o WHERE o.email =:email";
		TypedQuery<Accounts> query = em.createQuery(jsql,Accounts.class);
		query.setParameter("email",email);
		
		List<Accounts> list = query.getResultList();
		return list;
	}
	
	public boolean checkAcc(String id) {
		String jsql = "SELECT o FROM Accounts o WHERE :id in (SELECT a.account.username FROM Pays a)";
		TypedQuery<Accounts> query = em.createQuery(jsql,Accounts.class);
		query.setParameter("id",id);
		List<Accounts> list = query.getResultList();
		return !list.isEmpty();
	}
}
