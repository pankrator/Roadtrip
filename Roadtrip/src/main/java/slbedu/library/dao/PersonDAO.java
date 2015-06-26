package slbedu.library.dao;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import slbedu.library.model.Person;
import slbedu.library.model.Profile;

@Singleton
public class PersonDAO extends BaseDAO<Person> {
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;
	
	
	
	
	// NOT TESTED
	public Person findById(String id) {
		TypedQuery<Person> query = em.createQuery("SELECT p FROM Profile p WHERE p.id = :id", Person.class);
		query.setParameter("id", id);
		try {
			return query.getSingleResult();			
		} catch (NoResultException noresult) {
			return null;
		}
	}
	
	/* !!!
	 * this method will only work if all new parameters of Person are
	 * set with the new values before we call updatePerson(Person person);
	 */
	// NOT TESTED
	public Person updatePerson(Person person) {
		
		em.getTransaction().begin();
		TypedQuery<Person> query = em.createQuery("UPDATE Person"
				+ " SET name = :newName, birthYear = :newBirthYear, "
				+ "telephone = :newTelephone, isSmoking = :newIsSmoking,"
				+ "musicInTheCar = :newMusic WHERE id = :id", Person.class);
		query.setParameter("newName", person.getName());
		query.setParameter("newBirthYear", person.getBirthYear());
		query.setParameter("newTelephone", person.getTelephone());
		query.setParameter("newIsSmoking", 0); // TODO: Set parameter
		query.setParameter("newMusic", "Everything"); //TODO: Set parameter
		query.setParameter("id", person.getId());
		int updateCount = query.executeUpdate();
		em.getTransaction().commit();
		
		System.out.println(updateCount);
		
		return findById("" + person.getId());
	}
	
}
