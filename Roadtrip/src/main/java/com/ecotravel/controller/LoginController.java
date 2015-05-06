package com.ecotravel.controller;

import java.io.IOException;

import javax.ejb.Stateless;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

@Stateless
@Path("login")
public class LoginController {
	
	@GET
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		request.setAttribute("name", "Nikolay");
		rd = request.getRequestDispatcher("../login.jsp");
		
		rd.forward(request, response);
	}
}
