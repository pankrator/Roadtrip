package com.ecotravel.service;

import javax.inject.Inject;

import com.ecotravel.dao.PersonDAO;
import com.ecotravel.dao.ProfileDAO;
import com.ecotravel.model.Person;
import com.ecotravel.model.Profile;

public class ProfileService {
	
	@Inject
	private ProfileDAO profileDao;
	
	@Inject
	private PersonDAO personDao;
	
	public Profile editProfile(Profile profile, Person person) {
		personDao.save(person);
		profile.setPerson(person);
		
		profileDao.save(profile);
		
		return profile;
	}
	
	public Profile getProfileByPerson(Person person){
		return profileDao.findByPerson(person);
	}

}
