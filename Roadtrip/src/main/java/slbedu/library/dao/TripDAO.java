package slbedu.library.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import slbedu.library.model.Driver;
import slbedu.library.model.Trip;

@Singleton
public class TripDAO extends BaseDAO<Trip> {
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;
	
	public Trip find(int id) {
		return super.find(id, Trip.class);
	}
	
	public List<Trip> findTripsByDriverId(Driver driver) {
		TypedQuery<Trip> query = em.createQuery("SELECT trip FROM Trip trip WHERE trip.driver = :id", Trip.class);
		query.setParameter("id", driver);
		
		return query.getResultList();
	}
	
	public List<Trip> findTripsByTownsAndDate(Trip trip) {
		String q = "SELECT trip FROM Trip trip WHERE "
				+ "trip.travelFrom = "+ trip.getTravelFrom()
				+ " AND travelTo = " + trip.getTravelTo()
				+ "departureTime = " + trip.getDepartureTime();

		TypedQuery<Trip> query = em.createNamedQuery(q, Trip.class);
		
		return query.getResultList();
	}	
	
}
