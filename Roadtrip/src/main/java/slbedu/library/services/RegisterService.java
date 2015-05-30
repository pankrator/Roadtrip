package slbedu.library.services;

import javax.inject.Inject;

import slbedu.library.dao.PersonDAO;
import slbedu.library.dao.ProfileDAO;
import slbedu.library.model.Person;
import slbedu.library.model.Profile;

public class RegisterService {
	
	@Inject
	private ProfileDAO profileDao;
	
	@Inject
	private PersonDAO personDao;
	
	
	public Profile register(Profile profile, Person person) {
		person = personDao.save(person);
		profile.setPerson(person);
		
		return profileDao.save(profile);
	}
	
}
