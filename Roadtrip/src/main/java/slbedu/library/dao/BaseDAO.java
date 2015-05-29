package slbedu.library.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


@Singleton
public class BaseDAO<T> {
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;
	
	protected List<T> findAll(String selectedColumns, String tableName, Class<T> claz) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT ");
		sb.append(selectedColumns);
		sb.append(" FROM ");
		sb.append(tableName);
		sb.append(" model");
		TypedQuery<T> q = em.createQuery(sb.toString(), claz);

		return q.getResultList();
	}
	
	public T save(T toSave) {
		if (em.contains(toSave)) {
			em.refresh(toSave);
		} else {
			em.persist(toSave);
		}
		
		em.flush();
		return toSave;
	}
	
	protected T find(int id, Class<T> claz) {
		// TypedQuery<Driver> q =
		// em.createQuery("SELECT d.name FROM Driver d WHERE id=:id",
		// Driver.class)
		// .setParameter("id", id);
		//
		// return q.getSingleResult();
		return em.find(claz, id);
	}
	
	public void remove(T t) {
		em.remove(t);
	}
}
