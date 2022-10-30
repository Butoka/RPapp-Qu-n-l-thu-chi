package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RPapp.dao.AccountsDAO;
import com.RPapp.entity.Accounts;

@WebServlet("/change-pass")
public class ChangePassServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("change4", "active");
		req.getRequestDispatcher("/views/change-pass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ChangePass(req, resp);
	}

	public void ChangePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int loi = 0;
		if (req.getMethod().equalsIgnoreCase("POST")) {
			Accounts acc = (Accounts) req.getSession().getAttribute("users");

			String old_pass = req.getParameter("oldpass");
			String new_pass = req.getParameter("password");
			String confirm_pass = req.getParameter("confirmpass");

			if (old_pass.isEmpty()) {
				req.setAttribute("message1", "Old Password không được bỏ trống !");
				req.setAttribute("m1", true);
				loi++;
			} else {
				if (!old_pass.equals(acc.getPassword())) {
					req.setAttribute("message1", "Old Password không đúng !");
					req.setAttribute("m1", true);
				} else {
					req.setAttribute("message1", "");
					req.setAttribute("m1", false);
				}
			}

			if (new_pass.isEmpty()) {
				req.setAttribute("message2", "Password không được bỏ trống !");
				req.setAttribute("m2", true);
				loi++;
			} else {
				if (new_pass.length() > 8 || new_pass.length() < 3 ) {
					req.setAttribute("message2", "Password phải có ít nhất từ 3 > 8 ký tự !");
					req.setAttribute("m2", true);
					loi++;
				} else {
					req.setAttribute("message2", "");
					req.setAttribute("m2", false);
				}
			}

			if (confirm_pass.isEmpty()) {
				req.setAttribute("message3", "ConfirmPassword không được bỏ trống !");
				req.setAttribute("m3", true);
				loi++;
			} else {
				if (!confirm_pass.equals(new_pass)) {
					req.setAttribute("message3", "Password không trùng khớp !");
					req.setAttribute("m3", true);
					loi++;
				} else {
					req.setAttribute("message3", "");
					req.setAttribute("m3", false);
				}
			}

			if (loi == 0) {
				AccountsDAO dao = new AccountsDAO();
				acc.setPassword(new_pass);
				dao.update(acc);
				req.setAttribute("message", true);
			} else {
				req.setAttribute("message", false);
			}
			doGet(req, resp);
		}

	}
}
