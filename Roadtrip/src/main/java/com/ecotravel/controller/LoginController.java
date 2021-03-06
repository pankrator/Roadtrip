package com.ecotravel.controller;

import java.io.IOException;
import java.net.URISyntaxException;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import com.ecotravel.context.UserContext;
import com.ecotravel.model.Driver;
import com.ecotravel.model.Person;
import com.ecotravel.service.AuthenticationService;

@Stateless
@Path("login")
public class LoginController {
	
	@Inject
    private AuthenticationService authenticationService;
	
	@Inject
	private UserContext context;
	
	@POST
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void login(@Context HttpServletRequest request, @Context HttpServletResponse response,
					@FormParam(value="username") String username,
					@FormParam(value="password") String password) throws ServletException, IOException, URISyntaxException {
		RequestDispatcher rd = null;
		
		boolean isAuthenticated = authenticationService.authenticate(username, password, request);
		
		if (isAuthenticated) {
			Person person = context.getProfile().getPerson();
			if(person instanceof Driver) {
				rd = request.getRequestDispatcher("/driverMainPage.jsp");
			}
			else{
				rd = request.getRequestDispatcher("/tripSearch.jsp");
			}
		} else {
			request.setAttribute("login_error", "Wrong username/password!");
			
			rd = request.getRequestDispatcher("/index.jsp");
		}
		
		rd.forward(request, response);
	}
}
