package com.RPapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RPapp.dao.AccountsDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().setAttribute("user_temp","");
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();

		if (method.equalsIgnoreCase("POST")) {
			if(checkLogin(req, resp)) {
				resp.sendRedirect("/RPapp2022/dashboard");
			}else {
				req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
			}
		}
	}

	public boolean checkLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int loi = 0;
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		AccountsDAO dao = new AccountsDAO();

		req.getSession().setAttribute("user_temp",username);
		
		if (username.isEmpty()) {
			req.setAttribute("message1", "Username không được bỏ trống !");
			req.setAttribute("m1", true);
			loi++;
		} else {
			if (dao.findById(username) == null || !dao.findById(username).getActive()) {
				req.setAttribute("message1", "Username không hợp lệ !");
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
			if(dao.findById(username) != null && !dao.findById(username).getPassword().equals(password)) {
				req.setAttribute("message2", "Password không chính xác !");
				req.setAttribute("m2", true);
				loi++;
			}else {
				req.setAttribute("message2", "");
				req.setAttribute("m2", false);
				req.getSession().setAttribute("users",dao.findById(username));
			}
		}
		
		if(loi==0) {
			req.getSession().removeAttribute("user_temp");
		}else {
			return false;
		}
		
		return true;
	}

}
