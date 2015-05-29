package slbedu.library.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import slbedu.library.model.Profile;

@Singleton
public class ProfileDAO extends BaseDAO<Profile>{
	private String selectedColumns = "id, email, password, username";
	private String tableName = "Profile";
	@PersistenceContext(unitName="roadtrip")
    private EntityManager em;
	
	public Profile findByUsername(String username) {
		TypedQuery<Profile> query = em.createQuery("SELECT p FROM Profile p WHERE p.username = :username", Profile.class);
		query.setParameter("username", username);
		
		try {
			return query.getSingleResult();			
		} catch (NoResultException noresult) {
			return null;
		}
	}
	
	public List<Profile> findAll() {
		return super.findAll(selectedColumns, tableName, Profile.class);
	}

	public Profile find(int id) {
		return super.find(id, Profile.class);
	}
}
