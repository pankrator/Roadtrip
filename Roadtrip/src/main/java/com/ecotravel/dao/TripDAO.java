package com.ecotravel.dao;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
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
	
	public List<Trip> findTripsByTowns(String from, String to) {
		String q = "SELECT trip FROM Trip trip WHERE "
				+ "trip.travelFrom = :from"
				+ " AND trip.travelTo = :to";
		
		TypedQuery<Trip> query = em.createQuery(q, Trip.class);
		query.setParameter("from", from);
		query.setParameter("to", to);
		
		return query.getResultList();
	}
	
	public List<Trip> findTripsByDate(Date date) {
		String q = "SELECT trip FROM Trip trip WHERE "
				+ "trip.departureTime BETWEEN :date AND :date2";
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		TypedQuery<Trip> query = em.createQuery(q, Trip.class);
		query.setParameter("date", formatter.format(date));
	
		LocalDate tomorrow = LocalDate.from(date.toInstant()).plusDays(1);
		query.setParameter("date2", formatter.format(tomorrow));
		
		return query.getResultList();
	}	
}
