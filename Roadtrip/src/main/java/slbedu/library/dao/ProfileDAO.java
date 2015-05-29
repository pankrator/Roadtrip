package slbedu.library.dao;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import slbedu.library.model.Profile;

@Singleton
public class ProfileDAO {

	@PersistenceContext(unitName="roadtrip")
    private EntityManager em;
	
	public Profile findByUsername(String username) {
		TypedQuery<Profile> query = em.createQuery("SELECT p FROM Profile p WHERE p.username = :username", Profile.class);
		query.setParameter("username", username);
		
		return query.getSingleResult();
	}
}
