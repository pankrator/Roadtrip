package com.ecotravel.controller;

import java.io.IOException;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import slbedu.library.services.AuthenticationService;

@Stateless
@Path("login")
public class LoginController {
	
	@Inject
    private AuthenticationService authenticationService;
	
	@GET
	@Produces("application/json")
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("../login.jsp");
		
		rd.forward(request, response);
	}
	
	@POST
	@Consumes("application/json")
	public void login(@Context HttpServletRequest request, @Context HttpServletResponse response,
					@FormParam(value="username") String username,
					@FormParam(value="password") String password) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		boolean isAuthenticated = authenticationService.authenticate(username, password);
		
		if (isAuthenticated) {
			rd = request.getRequestDispatcher("../home.jsp");			
		} else {
			request.setAttribute("error", "WRONG_CREDENTIALS");
			rd = request.getRequestDispatcher("../login.jsp");
		}
		
		
		rd.forward(request, response);
		
	}
}
