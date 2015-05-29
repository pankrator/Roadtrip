package com.ecotravel.controller;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import slbedu.library.model.Profile;
import slbedu.library.services.RegisterService;

@Stateless
@Path("/register")
public class RegisterController {
	@Inject 
	private RegisterService regService;
	@POST
	public void post(@FormParam(value="username") String username,
					 @FormParam(value="password") String password,
					 @FormParam(value="confirm_password") String password2,
					 @FormParam(value="email") String email){
		
//		if(password.equals(password2)){
//			
//		}
		
		Profile profile = new Profile();
		profile.setEmail(email);
		profile.setPassword(password);
		profile.setUsername(username);
		
		regService.register(profile);
		
	}
}
