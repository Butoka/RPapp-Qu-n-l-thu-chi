package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.RPapp.dao.CategoriesDAO;
import com.RPapp.dao.PaysDAO;
import com.RPapp.dao.ReceivesDAO;
import com.RPapp.entity.Accounts;
import com.RPapp.entity.Pays;
import com.RPapp.entity.Receives;

@WebServlet({ "/pays-form", "/pays-form/add", "/pays-form/edit/*", "/pays-form/update",
		"/pays-form/delete/*" })
public class PaysFormServlet extends HttpServlet {

	Integer id;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		CategoriesDAO dao = new CategoriesDAO();
		req.setAttribute("cate", dao.findAllR());
		switch (path) {
		case "/pays-form": {
			req.setAttribute("change5", "active");
			req.setAttribute("re", true);
			req.setAttribute("di", "");
			req.getRequestDispatcher("/views/pays-form.jsp").forward(req, resp);
			break;
		}
		case "/pays-form/edit": {
			String uri = req.getRequestURI();
			Integer idedit = Integer.parseInt(uri.substring(uri.lastIndexOf("/") + 1));
			id = idedit;

			PaysDAO dao1 = new PaysDAO();
			Pays pay = dao1.findById(id);
			req.setAttribute("pay",pay);
			req.setAttribute("di", "hidden");
			req.setAttribute("re", false);

			req.getRequestDispatcher("/views/pays-form.jsp").forward(req, resp);

			break;
		}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();

		String method = req.getMethod();
		int addcount = 0;

		CategoriesDAO dao = new CategoriesDAO();
		PaysDAO paydao = new PaysDAO();

		switch (path) {
		case "/pays-form/add": {
			if (method.equalsIgnoreCase("POST")) {
				req.setAttribute("re", true);
				String name = req.getParameter("name");
				Double money = Double.valueOf(req.getParameter("money"));
				Integer catego = Integer.parseInt(req.getParameter("cate"));
				
				Accounts acc = (Accounts) req.getSession().getAttribute("users");
				
				Pays re = new Pays();
				re.setName(name);
				re.setCategory(dao.findById(catego));
				re.setMoney(money);
				re.setAccount(acc);
				
				int loi = 0;
				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						paydao.create(re);
						req.setAttribute("message", "Thêm thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/pays-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/pays-form/update": {
			if (method.equalsIgnoreCase("POST")) {
				String name = req.getParameter("name");
				Double money = Double.valueOf(req.getParameter("money"));
				Integer catego =Integer.parseInt(req.getParameter("cate"));
				
				Pays re = paydao.findById(id);
				re.setName(name);
				re.setCategory(dao.findById(catego));
				re.setMoney(money);
				
				int loi = 0;

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						paydao.update(re);
						req.setAttribute("message", "Cập nhật khoản chi thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/pays-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/pays-form/delete": {
			if (method.equalsIgnoreCase("POST")) {
				Pays p = paydao.findById(id);
				int loi = 0;

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						paydao.remove(id);
						req.setAttribute("message", "Xóa khoản chi thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/pays-form.jsp").forward(req, resp);
			}
			break;
		}
		}
	}

}
