package com.ecotravel.dao;

import java.util.List;

import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.ecotravel.model.Driver;
import com.ecotravel.model.Trip;

@Singleton
public class TripDAO extends BaseDAO<Trip> {
	
	@PersistenceContext(unitName = "roadtrip")
	private EntityManager em;
	
	public Trip find(Long id) {
		return super.find(id, Trip.class);
	}
	
	public List<Trip> findTripsByDriverId(Driver driver) {
		TypedQuery<Trip> query = em.createQuery("SELECT trip FROM Trip trip WHERE trip.driver = :id", Trip.class);
		query.setParameter("id", driver);
		
		return query.getResultList();
	}
	
	public List<Trip> findTripsByTownsAndDate(Trip trip) {
		String q = "SELECT trip FROM Trip trip WHERE "
				+ "trip.travelFrom = :from"
				+ " AND trip.travelTo = :to";
		
		TypedQuery<Trip> query = em.createQuery(q, Trip.class);
		query.setParameter("from", trip.getTravelFrom());
		query.setParameter("to", trip.getTravelTo());
		
		return query.getResultList();
	}	
	
}
