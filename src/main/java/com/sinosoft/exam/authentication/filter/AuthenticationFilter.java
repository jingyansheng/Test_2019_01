package com.sinosoft.exam.authentication.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class AuthenticationFilter implements Filter {
	
	List<String> noFilter = new ArrayList<String>();

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		Filter.super.init(filterConfig);
		noFilter.add("/tinymce");
		noFilter.add("/bootstrap");
		noFilter.add("/jquery");
		noFilter.add("/login");
		noFilter.add("/register");
		noFilter.add("/verifyRepeat");
		noFilter.add("/creAccount");
	}

	@Override
	public void doFilter(ServletRequest _request, ServletResponse _response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) _request;
		HttpServletResponse response = (HttpServletResponse) _response;
		
		String path = request.getRequestURI();
		if("/".equals(path)) {
			chain.doFilter(_request, _response);
			return;
		}
		for(int ix = 0; ix < noFilter.size(); ++ ix) {
			String curNoPage = noFilter.get(ix);
			if(path.indexOf(curNoPage) == 0) {
				chain.doFilter(_request, _response);
				return;
			}
		}
		
		HttpSession session = request.getSession();
		if(null == session.getAttribute("user")) {
			response.sendRedirect("/");
		} else {
			chain.doFilter(_request, _response);
		}
	}

}
