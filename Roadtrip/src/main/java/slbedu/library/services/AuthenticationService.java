package slbedu.library.services;

import javax.ejb.Stateless;
import javax.inject.Inject;

import slbedu.library.context.UserContext;
import slbedu.library.dao.ProfileDAO;
import slbedu.library.model.Profile;
import slbedu.library.utils.AuthenticationUtils;

@Stateless
public class AuthenticationService {
	
	@Inject
	private UserContext context;
	
	@Inject
	private ProfileDAO profileDAO;
	
	public boolean authenticate(String username, String password) {
		Profile profile = profileDAO.findByUsername(username);
		
		if (profile.getPassword().equals(AuthenticationUtils.getHashedPassword(password))) {
			context.setProfile(profile);
			return true;
		}
		
		return false;
	}
}
