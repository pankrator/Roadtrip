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
	
	public List<Object> findAll() {
		Query q = em.createQuery("SELECT d.name FROM Driver d");
		
		return q.getResultList();
	}
	
	public void add() {
		em.persist(new Driver("Nikolay"));
	}
}
