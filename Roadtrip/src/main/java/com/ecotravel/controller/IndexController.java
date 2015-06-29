package com.ecotravel.controller;

import java.io.IOException;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import slbedu.library.context.UserContext;
import slbedu.library.model.Driver;

@Stateless
@Path("/")
public class IndexController {
	
	@Inject
	private UserContext context;
	
	@GET
	@Produces("text/html")
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		boolean isLoggedIn = context.getProfile() != null;
		
		if (isLoggedIn) {
			if (context.getProfile().getPerson() instanceof Driver) {
				rd = request.getRequestDispatcher("/driverMainPage.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/trip/tripSearch");
				return;
			}
		} else {
			rd = request.getRequestDispatcher("/index.jsp");			
		}
		
		
		rd.forward(request, response);
	}
}
