package com.RPapp.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.RPapp.entity.Reports;
import com.RPapp.util.JpaUtils;

public class ReportDAO {
	EntityManager em = JpaUtils.getEntityManager();

	public ReportDAO() {
		// TODO Auto-generated constructor stub
	}
//	public List<Integer> selectYear() {
//		String jpql = "SELECT year(o.likeDate) FROM Favorite o GROUP BY year(o.likeDate)";
//		TypedQuery<Integer> query = em.createQuery(jpql, Integer.class);
//		List<Integer> list = query.getResultList();
//		return list;
//	}

	public List<Reports> favoriteReport() {
		String jpql = "SELECT new REPORT(o.video.title, count(o), max(o.likeDate), min(o.likeDate)) FROM FAVORITE o GROUP BY o.video.title";
		TypedQuery<Reports> query = em.createQuery(jpql, Reports.class);
		List<Reports> list = query.getResultList();
		return list;
	}

//	public List<FAVORITE> favoritesUserReport(HttpServletRequest request) {
//		String keyword = request.getParameter("title1");
//		String jpql = "SELECT DISTINCT o FROM FAVORITE o WHERE o.video.title LIKE :keyword";
//		TypedQuery<FAVORITE> query = em.createQuery(jpql, FAVORITE.class);
//		query.setParameter("keyword", "%" + keyword + "%");
//		List<FAVORITE> list = query.getResultList();
//		return list;
//	}
//	
//	public List<SHARES> shareReport(HttpServletRequest request){
//		String keyword = request.getParameter("title2");
//		String jpql = "SELECT DISTINCT o FROM SHARES o WHERE o.video.title LIKE :keyword";
//		TypedQuery<SHARES> query = em.createQuery(jpql, SHARES.class);
//		query.setParameter("keyword", "%" + keyword + "%");
//		List<SHARES> list = query.getResultList();
//		return list;
//	}
//	
//	public List<Long> getCountUser(){
//		String jpql = "SELECT count(o) FROM USERS o";
//		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
//		List<Long> list = query.getResultList();
//		
//		return list;
//	}
//	public List<Long> getCountVideo(){
//		String jpql = "SELECT count(o) FROM VIDEO o";
//		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
//		List<Long> list = query.getResultList();
//		
//		return list;
//	}
//	public List<Long> getCountViews(){
//		String jpql = "SELECT sum(o.views) FROM VIDEO o";
//		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
//		List<Long> list = query.getResultList();
//		
//		return list;
//	}
//	
	public List<Long> getLikeCount() {
		String jpql = "SELECT count(o) FROM FAVORITE o";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		List<Long> list = query.getResultList();
		return list;
	}

}
