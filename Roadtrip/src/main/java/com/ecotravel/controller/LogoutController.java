package com.ecotravel.controller;



import java.io.IOException;
import java.net.URISyntaxException;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import slbedu.library.services.AuthenticationService;

@Stateless
@Path("logout")
public class LogoutController {

	@Inject
    private AuthenticationService authenticationService;
	
	@GET
	public void logout(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException, URISyntaxException {
		//RequestDispatcher rd = null;
			this.authenticationService.logout();
//			rd = request.getRequestDispatcher("/index.jsp");
//			rd.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/");
	}
}
