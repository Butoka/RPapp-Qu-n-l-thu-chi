package com.RPapp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.RPapp.entity.Categories;
import com.RPapp.util.JpaUtils;

public class CategoriesDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	
	public Categories create(Categories entity) {
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
	public Categories update(Categories entity) {
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
	public Categories remove(Integer id) {
		Categories entity = this.findById(id);
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
	public Categories findById(Integer id) {
		Categories entity = em.find(Categories.class, id);
		return entity;
	}
	public List<Categories> findAll() {
		String jsql = "FROM Categories";
		TypedQuery<Categories> query = em.createQuery(jsql,Categories.class);
		List<Categories> list = query.getResultList();
		return list;
	}
	
	public List<Categories> findAllP() {
		String jsql = "SELECT o FROM Categories o WHERE o.pay = true";
		TypedQuery<Categories> query = em.createQuery(jsql,Categories.class);
		List<Categories> list = query.getResultList();
		return list;
	}
	
	public List<Categories> findAllR() {
		String jsql = "SELECT o FROM Categories o WHERE o.pay = false";
		TypedQuery<Categories> query = em.createQuery(jsql,Categories.class);
		List<Categories> list = query.getResultList();
		return list;
	}
	
	public boolean checkCate(Integer id) {
		String jsql = "SELECT o FROM Categories o WHERE :id in (SELECT a.category.id FROM Pays a)";
		TypedQuery<Categories> query = em.createQuery(jsql,Categories.class);
		query.setParameter("id",id);
		List<Categories> list = query.getResultList();
		return !list.isEmpty();
	}
}
