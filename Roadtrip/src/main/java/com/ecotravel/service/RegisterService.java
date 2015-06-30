package com.ecotravel.service;

import javax.inject.Inject;

import com.ecotravel.dao.PersonDAO;
import com.ecotravel.dao.ProfileDAO;
import com.ecotravel.model.Person;
import com.ecotravel.model.Profile;

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
	
	public boolean doesPersonExists(String username){
		return profileDao.findByUsername(username) != null;
	}
	
}
