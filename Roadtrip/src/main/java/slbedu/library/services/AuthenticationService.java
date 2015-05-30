package slbedu.library.services;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import slbedu.library.context.UserContext;
import slbedu.library.dao.ProfileDAO;
import slbedu.library.model.Profile;

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
		
		if (profile.getPassword().equals(password)) {
			context.setProfile(profile);
			return true;
		}
		
		return false;
	}
}
