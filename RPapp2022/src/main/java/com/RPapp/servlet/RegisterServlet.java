package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RPapp.dao.AccountsDAO;
import com.RPapp.dao.RolesDAO;
import com.RPapp.entity.Accounts;
import com.RPapp.entity.Roles;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute("user_temp");
		req.setAttribute("message", false);
		req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();

		if (method.equalsIgnoreCase("POST")) {
			register(req, resp);
			req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
		}
	}

	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int count = 0;
		if (checkRegister(req, resp)) {
			try {
				AccountsDAO dao = new AccountsDAO();
				RolesDAO daorole = new RolesDAO();
				Roles role = daorole.findById("content");

				String username = req.getParameter("username");
				String password = req.getParameter("password");
				String confirmpass = req.getParameter("confirmpass");
				String fullname = req.getParameter("fullname");
				Boolean gender = Boolean.valueOf(req.getParameter("gender"));
				String email = req.getParameter("email");

				Accounts acc = new Accounts(username, password, fullname, gender, email, true, role);
				dao.create(acc);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public boolean checkRegister(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String confirmpass = req.getParameter("confirmpass");
		String fullname = req.getParameter("fullname");
		Boolean gender = Boolean.valueOf(req.getParameter("gender"));
		String email = req.getParameter("email");

		String gmailregex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@gmail+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		AccountsDAO dao = new AccountsDAO();
		RolesDAO daorole = new RolesDAO();
		Roles role = daorole.findById("content");

		Accounts user_tmp = new Accounts(username, password, fullname, gender, email, true, role);

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
//		if (gender == null) {
//			req.setAttribute("message5", "Vui lòng chọn giới tính !");
//			req.setAttribute("m5", true);
//			loi++;
//		} else {
//			req.setAttribute("message5", "");
//			req.setAttribute("m5", false);
//		}
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
			req.getSession().removeAttribute("user_temp");
			req.setAttribute("message", true);
		} else {
			req.setAttribute("message", false);
			return false;
		}

		return true;

	}
}
