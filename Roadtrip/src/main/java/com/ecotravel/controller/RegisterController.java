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
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import com.ecotravel.enums.PersonType;
import com.ecotravel.model.Driver;
import com.ecotravel.model.Passenger;
import com.ecotravel.model.Person;
import com.ecotravel.model.Profile;
import com.ecotravel.service.MailSender;
import com.ecotravel.service.RegisterService;
import com.ecotravel.utils.AuthenticationUtils;

@Stateless
@Path("register")
public class RegisterController {
	
	@Inject 
	private RegisterService regService;
	
	@Inject
	private MailSender mailSender;
	
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
					 @FormParam(value="email") String email,
					 @FormParam(value="personType") PersonType type,
					 @FormParam(value="telephone") String telephone,
					 @FormParam(value="name") String name,
					 @FormParam(value="birthYear") int birthYear) throws ServletException, IOException{
		
		RequestDispatcher rd = null;
		
		
		if (!password.equals(password2)) {
			request.setAttribute("confirm_error_msg", "Password mismatch!");
			rd = request.getRequestDispatcher("/register.jsp");
		} else {
			if(regService.doesPersonExists(username)){
				request.setAttribute("confirm_error_msg", "This username is already taken!");
				rd = request.getRequestDispatcher("/register.jsp");
			}
			else{
				Person person = null;
				if (type == PersonType.DRIVER) {
					person = new Driver();
				} else {
					person = new Passenger();
				}
				person.setBirthYear(birthYear);
				person.setName(name);
				person.setTelephone(telephone);
				
				Profile profile = new Profile();
				profile.setEmail(email);
				String hashedPassword = AuthenticationUtils.getHashedPassword(password);
				profile.setPassword(hashedPassword);
				profile.setUsername(username);
				
				regService.register(profile, person);
				
//				rd = request.getRequestDispatcher("/login.jsp");
				response.sendRedirect(request.getContextPath());
				return;
			}
			
			
		}
		
		rd.forward(request, response);		
	}
	
	@Path("/forgottenPassword")
	public void forgottenPassword(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException, URISyntaxException {
		RequestDispatcher rd = null;
			
		
		rd = request.getRequestDispatcher("/forgottenPassword.jsp");
		rd.forward(request, response);
	}
	
	@POST
	@Path("/resetPassword")
	public void resetPassword(@Context HttpServletRequest request, @Context HttpServletResponse response,
					@FormParam(value="username") String username) throws ServletException, IOException, URISyntaxException {
		RequestDispatcher rd = null;
		
		if(username == null){
			return;
		}
		mailSender.sendMessage(username);
		response.sendRedirect(request.getContextPath());
	}
}
