package slbedu.library.dao;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import slbedu.library.model.Person;

@Singleton
public class PersonDAO extends BaseDAO<Person> {
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;
	
	@Override
	public Person save(Person toSave) {
		Person current = this.find(toSave.getId(), Person.class);
		
		if (current == null) {
			em.persist(toSave);
		} else {
			toSave = em.merge(toSave);
			em.flush();
		}
		
		return toSave;
	}
	
	public Person findById(Long id) {
		return super.find(id, Person.class);
	}
	
}
