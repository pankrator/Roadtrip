package slbedu.library.services;

import javax.inject.Inject;

import slbedu.library.dao.ProfileDAO;
import slbedu.library.model.Profile;

public class RegisterService {
	@Inject
	private ProfileDAO dao;
	public Profile register(Profile p){
		return dao.save(p);	
	}
	
}
