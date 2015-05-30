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

import slbedu.library.model.Profile;
import slbedu.library.services.RegisterService;
import slbedu.library.utils.AuthenticationUtils;

@Stateless
@Path("register")
public class RegisterController {
	
	@Inject 
	private RegisterService regService;
	
	@GET
	@Produces("application/json")
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/register.jsp");
		
		rd.forward(request, response);
	}
	
	@POST
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void post(@Context HttpServletRequest request, @Context HttpServletResponse response,
					 @FormParam(value="username") String username,
					 @FormParam(value="password") String password,
					 @FormParam(value="confirm_password") String password2,
					 @FormParam(value="email") String email) throws ServletException, IOException{
		
//		if(password.equals(password2)){
//			
//		}
//		password = AuthenticationUtils.getHashedPassword(password);
		
		Profile profile = new Profile();
		profile.setEmail(email);	
		profile.setPassword(password);
		profile.setUsername(username);
		
		regService.register(profile);
		
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/login.jsp");
		
		rd.forward(request, response);
		
	}
}
