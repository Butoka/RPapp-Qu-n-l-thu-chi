package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.RPapp.dao.AccountsDAO;
import com.RPapp.dao.CategoriesDAO;
import com.RPapp.dao.RolesDAO;
import com.RPapp.entity.Accounts;
import com.RPapp.entity.Categories;
import com.RPapp.entity.Roles;

@WebServlet({ "/account-form", "/account-form/add", "/account-form/edit/*", "/account-form/update",
		"/account-form/delete/*" })
public class AccountsFormServlet extends HttpServlet {

	String id;
	String id2;
	Accounts acc;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		RolesDAO daorole = new RolesDAO();
		req.setAttribute("role", daorole.findAll());
		switch (path) {
		case "/account-form": {
			req.setAttribute("change2", "active");
			req.setAttribute("re", true);
			req.setAttribute("di", "");

			req.getRequestDispatcher("/views/account-form.jsp").forward(req, resp);
			break;
		}
		case "/account-form/edit": {
			String uri = req.getRequestURI();
			String idedit = uri.substring(uri.lastIndexOf("/") + 1);
			id = idedit;
			id2 = id;
			AccountsDAO dao = new AccountsDAO();
			acc = dao.findById(id);

			req.setAttribute("acc", acc);
			req.setAttribute("di", "hidden");
			req.setAttribute("re", false);

			req.getRequestDispatcher("/views/account-form.jsp").forward(req, resp);

			break;
		}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();

		String method = req.getMethod();
		int addcount = 0;

		AccountsDAO dao = new AccountsDAO();
		RolesDAO daorole = new RolesDAO();
		req.setAttribute("role", daorole.findAll());
		switch (path) {
		case "/account-form/add": {
			if (method.equalsIgnoreCase("POST")) {

				req.setAttribute("re", true);
				String username = req.getParameter("username");
				String password = req.getParameter("password");
				String confirmpass = req.getParameter("confirmpass");
				String fullname = req.getParameter("fullname");
				Boolean gender = Boolean.valueOf(req.getParameter("gender"));
				Boolean active = Boolean.valueOf(req.getParameter("active"));
				String email = req.getParameter("email");
				String rol = req.getParameter("role");

				String gmailregex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

				daorole = new RolesDAO();
				Roles role = daorole.findById(rol);

				Accounts user_tmp = new Accounts(username, password, fullname, gender, email, active, role);

				req.getSession().setAttribute("user_temp", user_tmp);

				int loi = 0;

				if (username.isEmpty()) {
					req.setAttribute("message1", "Username không được bỏ trống !");
					req.setAttribute("m1", true);
					loi++;
				} else {
					if (dao.findById(username) != null) {
						req.setAttribute("message1", "Username đã tồn tại !");
						req.setAttribute("m1", true);
						loi++;
					} else {
						req.setAttribute("message1", "");
						req.setAttribute("m1", false);
					}
				}

				if (password.isEmpty()) {
					req.setAttribute("message2", "Password không được bỏ trống !");
					req.setAttribute("m2", true);
					loi++;
				} else {
					if (password.length() > 8 || password.length() < 3) {
						req.setAttribute("message2", "Password phải có ít nhất từ 3 > 8 ký tự !");
						req.setAttribute("m2", true);
						loi++;
					} else {
						req.setAttribute("message2", "");
						req.setAttribute("m2", false);
					}
				}

				if (confirmpass.isEmpty()) {
					req.setAttribute("message3", "ConfirmPassword không được bỏ trống !");
					req.setAttribute("m3", true);
					loi++;
				} else {
					if (!confirmpass.equals(password)) {
						req.setAttribute("message3", "Password không trùng khớp !");
						req.setAttribute("m3", true);
						loi++;
					} else {
						req.setAttribute("message3", "");
						req.setAttribute("m3", false);
					}
				}

				if (fullname.isEmpty()) {
					req.setAttribute("message4", "Fullname không được bỏ trống !");
					req.setAttribute("m4", true);
					loi++;
				} else {
					req.setAttribute("message3", "");
					req.setAttribute("m3", false);
				}

				if (email.isEmpty()) {
					req.setAttribute("message6", "Email không được bỏ trống !");
					req.setAttribute("m6", true);
					loi++;
				} else {
					if (!dao.findEmail(email).isEmpty()) {
						req.setAttribute("message6", "Email đã tồn tại !");
						req.setAttribute("m6", true);
						loi++;
					} else if (!email.matches(gmailregex)) {
						req.setAttribute("message6", "Định dạng email không hợp lệ!");
						req.setAttribute("m6", true);
						loi++;
					} else {
						req.setAttribute("message6", "");
						req.setAttribute("m6", false);
					}
				}

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						req.getSession().removeAttribute("user_temp");
						dao.create(user_tmp);
						req.setAttribute("message", "Thêm tài khoản thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/account-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/account-form/update": {
			if (method.equalsIgnoreCase("POST")) {
				req.setAttribute("re", true);
				String id = req.getParameter("username");
				String fullname = req.getParameter("fullname");
				Boolean gender = Boolean.valueOf(req.getParameter("gender"));
				Boolean active = Boolean.valueOf(req.getParameter("active"));
				String email = req.getParameter("email");
				String rol = req.getParameter("role");

				String gmailregex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

				int loi = 0;

				if (fullname.isEmpty()) {
					req.setAttribute("message4", "Fullname không được bỏ trống !");
					req.setAttribute("m4", true);
					loi++;
				} else {
					req.setAttribute("message3", "");
					req.setAttribute("m3", false);
				}

				if (email.isEmpty()) {
					req.setAttribute("message6", "Email không được bỏ trống !");
					req.setAttribute("m6", true);
					loi++;
				} else {
					if (!email.matches(gmailregex)) {
						req.setAttribute("message6", "Định dạng email không hợp lệ!");
						req.setAttribute("m6", true);
						loi++;
					} else {
						req.setAttribute("message6", "");
						req.setAttribute("m6", false);
					}
				}
				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						Accounts users = dao.findById(id);
						users.setFullname(fullname);
						users.setGender(gender);
						users.setActive(active);
						users.setEmail(email);
						users.setRole(daorole.findById(rol));
						
						dao.update(users);
						req.setAttribute("message", "Cập nhật tài khoản " + id + " thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/account-form.jsp").forward(req, resp);
			}
			break;
		}
		case "/account-form/delete": {
			if (method.equalsIgnoreCase("POST")) {
				String id = req.getParameter("username");
				Accounts ac = dao.findById(id);
				Accounts acc = (Accounts)req.getSession().getAttribute("users");
				
				int loi = 0;
				if (dao.checkAcc(id) || acc.getUsername().equalsIgnoreCase(id) || ac.getRole().getId().equals("admin")) {
					req.setAttribute("del", "alert-danger");
					req.setAttribute("message", "Không thể xóa tài khoản này !");
					req.setAttribute("m1", true);
					req.setAttribute("di", "hidden");
					loi++;
				}

				if (loi == 0) {
					addcount++;
					if (addcount != 0) {
						dao.remove(id);
						req.setAttribute("message", "Xóa tài khoản "+id+" thành công !");
					} else {
						req.setAttribute("message", null);
					}
				}
				req.getRequestDispatcher("/views/account-form.jsp").forward(req, resp);
			}
			break;
		}
		}
	}

}
