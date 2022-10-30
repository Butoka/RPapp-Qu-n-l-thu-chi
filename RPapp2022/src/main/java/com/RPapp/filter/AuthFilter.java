package com.RPapp.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RPapp.entity.Accounts;

@WebFilter({ "/dashboard", "/dashboard/*", "/change-pass", "/categories-manager", "/account-manager", "/account-form",
		"/account-form/*", "/categories-form", "/categories-form/*", "/receives-form", "/receives-form/*", "/pays-form",
		"/pays-form/*" })
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		Accounts user = (Accounts) req.getSession().getAttribute("users");

		String uri = req.getRequestURI();
		String error = "";
		if (user == null) {// || uri.contains("/index")
			error = resp.encodeURL("vui-long-dang-nhap-de-vao-duoc-trang-quan-tri!");
			// System.out.println("Vui lòng đăng nhập !");
		}
		if (!error.isEmpty()) {
			req.getSession().setAttribute("seuri", uri);
			resp.sendRedirect("/RPapp2022/login?error=" + resp.encodeURL(error));
		} else {
			chain.doFilter(req, resp);
		}

	}

}
