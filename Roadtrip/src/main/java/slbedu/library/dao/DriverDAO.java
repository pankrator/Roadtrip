package slbedu.library.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import slbedu.library.model.Driver;

@Singleton
public class DriverDAO extends BaseDAO<Driver> {
	private String selectedColumns = "*";
	
	private String tableName = "Driver";
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;

	public List<Driver> getAllDrivers() {
		TypedQuery<Driver> query = em.createNamedQuery("findAll", Driver.class);

		return query.getResultList();
	}

	public List<Driver> findAll() {
		return super.findAll(selectedColumns, tableName, Driver.class);
	}

	public Driver find(int id) {
		return super.find(id, Driver.class);
	}
}
