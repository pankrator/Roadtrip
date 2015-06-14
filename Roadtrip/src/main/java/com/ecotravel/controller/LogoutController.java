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
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import slbedu.library.services.AuthenticationService;

@Stateless
@Path("logout")
public class LogoutController {

	@Inject
    private AuthenticationService authenticationService;
	
	@POST
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void logout(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException, URISyntaxException {
		//RequestDispatcher rd = null;
			this.authenticationService.logout();
//			rd = request.getRequestDispatcher("/index.jsp");
//			rd.forward(request, response);
			response.sendRedirect("/Roadtrip");
	}
}
