package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.RPapp.dao.CategoriesDAO;
import com.RPapp.dao.ReceivesDAO;
import com.RPapp.entity.Accounts;
import com.RPapp.entity.Categories;
import com.RPapp.entity.Receives;

@WebServlet({ "/receives-form", "/receives-form/add", "/receives-form/edit/*", "/receives-form/update",
		"/receives-form/delete/*" })
public class ReceivesFormServlet extends HttpServlet {

	Integer id;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		CategoriesDAO dao = new CategoriesDAO();
		req.setAttribute("cate", dao.findAllR());
		switch (path) {
		case "/receives-form": {
			req.setAttribute("change5", "active");
			req.setAttribute("re", true);
			req.setAttribute("di", "");
			req.getRequestDispatcher("/views/receives-form.jsp").forward(req, resp);
			break;
		}
		case "/receives-form/edit": {
			String uri = req.getRequestURI();
			Integer idedit = Integer.parseInt(uri.substring(uri.lastIndexOf("/") + 1));
			id = idedit;

			ReceivesDAO dao1 = new ReceivesDAO();
			Receives rec = dao1.findById(id);
			req.setAttribute("rec", rec);
			req.setAttribute("di", "hidden");
			req.setAttribute("re", false);

			req.getRequestDispatcher("/views/receives-form.jsp").forward(req, resp);

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
		ReceivesDAO redao = new ReceivesDAO();

		switch (path) {
		case "/receives-form/add": {
			if (method.equalsIgnoreCase("POST")) {
				req.setAttribute("re", true);
				String name = req.getParameter("name");
				Double money = Double.valueOf(req.getParameter("money"));
				Integer catego = Integer.parseInt(req.getParameter("cate"));
				Boolean levels = Boolean.valueOf(req.getParameter("levels"));
				
				Accounts acc = (Accounts) req.getSession().getAttribute("users");
				
				Receives re = new Receives();
				re.setName(name);
				re.setCategory(dao.findById(catego));
				re.setLevels(levels);
				re.setMoney(money);
				re.setAccount(acc);
				
				int loi = 0;
				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						redao.create(re);
						req.setAttribute("message", "Thêm thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/receives-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/receives-form/update": {
			if (method.equalsIgnoreCase("POST")) {
				String name = req.getParameter("name");
				Double money = Double.valueOf(req.getParameter("money"));
				Integer catego =Integer.parseInt(req.getParameter("cate"));
				Boolean levels = Boolean.valueOf(req.getParameter("levels"));
				
				Receives re = redao.findById(id);
				re.setName(name);
				re.setCategory(dao.findById(catego));
				re.setLevels(levels);
				re.setMoney(money);
				
				int loi = 0;

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						redao.update(re);
						req.setAttribute("message", "Cập nhật khoản thu thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/receives-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/receives-form/delete": {
			if (method.equalsIgnoreCase("POST")) {
				Receives re = redao.findById(id);
				int loi = 0;

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						redao.remove(id);
						req.setAttribute("message", "Xóa khoản thu thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/receives-form.jsp").forward(req, resp);
			}
			break;
		}
		}
	}

}
