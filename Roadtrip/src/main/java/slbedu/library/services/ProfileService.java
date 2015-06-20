package slbedu.library.services;

import javax.inject.Inject;

import slbedu.library.dao.PersonDAO;
import slbedu.library.dao.ProfileDAO;
import slbedu.library.model.Person;
import slbedu.library.model.Profile;

public class ProfileService {
	
	@Inject
	private ProfileDAO profileDao;
	
	@Inject
	private PersonDAO personDao;
	
//	public Profile editProfile(Profile profile, Person person) {
//		person = personDao.update(person);
//		profile.setPerson(person);
//
//		return profileDao.update(profile);
//	}

}
