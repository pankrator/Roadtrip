package com.ecotravel.service;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import com.ecotravel.context.UserContext;
import com.ecotravel.dao.ProfileDAO;
import com.ecotravel.model.Profile;
import com.ecotravel.utils.AuthenticationUtils;

@Stateless
public class AuthenticationService {
	
	@Inject
	private UserContext context;
	
	@Inject
	private ProfileDAO profileDAO;
	
	public boolean authenticate(String username, String password, HttpServletRequest request) {
		Profile profile = profileDAO.findByUsername(username);
		
		if (profile == null) {
			return false;
		}
		
		String hashedPassword = AuthenticationUtils.getHashedPassword(password);
		
		if (profile.getPassword().equals(hashedPassword)) {
			context.setProfile(profile);
			return true;
		}
		
		return false;
	}
	
	public void logout(){
		this.context.setProfile(null);		
	}
}
