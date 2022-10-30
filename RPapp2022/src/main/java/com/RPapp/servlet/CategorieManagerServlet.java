package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RPapp.dao.CategoriesDAO;

@WebServlet("/categories-manager")
public class CategorieManagerServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("change2", "active");
		
		CategoriesDAO dao = new CategoriesDAO();
		req.setAttribute("cate1", dao.findAllR());
		req.setAttribute("cate2", dao.findAllP());
		
		req.getRequestDispatcher("/views/categories-manager.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
}
