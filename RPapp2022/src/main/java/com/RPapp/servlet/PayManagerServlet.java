package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RPapp.dao.PaysDAO;
import com.RPapp.dao.ReceivesDAO;

@WebServlet("/pays-manager")
public class PayManagerServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("change5", "active");
		
		ReceivesDAO r_dao = new ReceivesDAO();
		PaysDAO p_dao = new PaysDAO();
		
		req.setAttribute("receives", r_dao.findAll());
		req.setAttribute("pays",p_dao.findAll());
		
		req.getRequestDispatcher("/views/pays-manager.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
}
