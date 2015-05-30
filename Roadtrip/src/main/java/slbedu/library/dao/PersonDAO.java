package slbedu.library.dao;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import slbedu.library.model.Person;

@Singleton
public class PersonDAO extends BaseDAO<Person> {
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;
	
}
