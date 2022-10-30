package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.RPapp.dao.CategoriesDAO;
import com.RPapp.entity.Categories;

@WebServlet({ "/categories-form", "/categories-form/add", "/categories-form/edit/*", "/categories-form/update",
		"/categories-form/delete/*" })
public class CategorieFormServlet extends HttpServlet {

	Integer id;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch (path) {
		case "/categories-form": {
			req.setAttribute("change2", "active");
			req.setAttribute("re", true);
			req.setAttribute("di", "");
			req.getRequestDispatcher("/views/categories-form.jsp").forward(req, resp);
			break;
		}
		case "/categories-form/edit": {
			String uri = req.getRequestURI();
			Integer idedit = Integer.parseInt(uri.substring(uri.lastIndexOf("/") + 1));
			id = idedit;

			CategoriesDAO dao = new CategoriesDAO();
			Categories cate = dao.findById(id);
			req.setAttribute("cate", cate);
			req.setAttribute("di", "hidden");
			req.setAttribute("re", false);

			req.getRequestDispatcher("/views/categories-form.jsp").forward(req, resp);

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

		switch (path) {
		case "/categories-form/add": {
			if (method.equalsIgnoreCase("POST")) {
				Categories cate = new Categories();
				req.setAttribute("re", true);
				String name = req.getParameter("name");
				Boolean pays = Boolean.valueOf(req.getParameter("pays"));
				int loi = 0;
				if (name.isEmpty()) {
					req.setAttribute("message1", "Tên danh mục không được bỏ trống !");
					req.setAttribute("m1", true);
					loi++;
				} else {
					req.setAttribute("message1", "");
					req.setAttribute("m1", false);

					cate.setName(name);
					cate.setPay(pays);

					dao.create(cate);
				}

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						req.setAttribute("message", "Thêm danh mục thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/categories-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/categories-form/update": {
			if (method.equalsIgnoreCase("POST")) {
				String name = req.getParameter("name");
				Categories cate = dao.findById(id);
				cate.setName(name);
				req.setAttribute("cate",cate);
				int loi = 0;
				if (name.isEmpty()) {
					req.setAttribute("message1", "Tên danh mục không được bỏ trống !");
					req.setAttribute("m1", true);
					req.setAttribute("di", "hidden");
					loi++;
				} else {
					req.setAttribute("message1", "");
					req.setAttribute("m1", false);

					dao.update(cate);
				}

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						req.setAttribute("message", "Cập nhật danh mục thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/categories-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/categories-form/delete": {
			if (method.equalsIgnoreCase("POST")) {
				Categories cate = dao.findById(id);
				int loi = 0;
				if (dao.checkCate(id)) {
					req.setAttribute("del","alert-danger");
					req.setAttribute("message", "Không thể xóa danh mục này !");
					req.setAttribute("m1", true);
					req.setAttribute("di", "hidden");
					loi++;
				} 

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						dao.remove(id);
						req.setAttribute("message", "Xóa danh mục thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/categories-form.jsp").forward(req, resp);
			}
			break;
		}
		}
	}

}
