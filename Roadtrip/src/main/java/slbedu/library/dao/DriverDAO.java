package slbedu.library.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import slbedu.library.model.Driver;

@Singleton
public class DriverDAO {

	@PersistenceContext(unitName="roadtrip")
    private EntityManager em;
	
	public List<Driver> getAllDrivers() {
		TypedQuery<Driver> query = em.createNamedQuery("findAll", Driver.class);
		
		return query.getResultList();
	} 
	
	public List<Driver> findAll() {
		Query q = em.createQuery("SELECT d.name FROM Driver d");
		
		return (List<Driver>)q.getResultList();
	}
	
	public void add() {
		em.persist(new Driver("Ïvan Georgiev", 10, "01234566", 1990, 0, 1990, false, "Country"));
	}
}
