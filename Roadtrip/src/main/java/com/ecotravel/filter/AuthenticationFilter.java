package com.ecotravel.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecotravel.context.UserContext;

@Stateless
@WebFilter("/*")
public class AuthenticationFilter implements Filter {
	
	private static List<String> normalPaths = new ArrayList<String>(Arrays.asList(
		"/Roadtrip/",
		"/Roadtrip/images/.*",
		"/Roadtrip/js/.*",
		"/Roadtrip/styles/.*",
		"/Roadtrip/login",
		"/Roadtrip/register",
		"/Roadtrip/register/.*",
		"/Roadtrip/about",
		"/Roadtrip/history"
	));

	@Inject
	private UserContext context;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        String requestedPath = request.getRequestURI();
        boolean needsAuth = needsAuthentication(requestedPath);
        
        request.setAttribute("context", context);
        if (needsAuth && context.getProfile() == null) {
        	response.sendRedirect(request.getContextPath() + "/");
        } else {
        	chain.doFilter(request, response);
        }
	}
	
	private boolean needsAuthentication(String path) {
		for (String config : normalPaths) {
			if (path.matches(config)) {
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
