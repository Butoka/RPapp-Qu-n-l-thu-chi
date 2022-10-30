package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.RPapp.dao.AccountsDAO;
import com.RPapp.dao.CategoriesDAO;
import com.RPapp.dao.PaysDAO;
import com.RPapp.dao.ReceivesDAO;
import com.RPapp.dao.RolesDAO;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("change1","active");
		
		AccountsDAO daoac = new AccountsDAO();
		CategoriesDAO daoct = new CategoriesDAO();
		ReceivesDAO daore = new ReceivesDAO();
		PaysDAO daopay = new PaysDAO();
		
		
		req.setAttribute("count2", daoac.findAll().size());
		req.setAttribute("count1", daoct.findAll().size());
		req.setAttribute("count3", daore.getTotal());
		req.setAttribute("count4", daopay.getTotal());
		
		JSONObject obj = new JSONObject();
        obj.put("Tổng chi",daopay.getTotal());
        obj.put("Tổng thu", daore.getTotal());
        obj.put("Tổng cộng", daore.getTotal()+daopay.getTotal());
		
        req.setAttribute("report", obj);
		
		req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
	}
}
