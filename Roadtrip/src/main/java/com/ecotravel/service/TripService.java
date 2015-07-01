package com.ecotravel.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;

import com.ecotravel.dao.TripDAO;
import com.ecotravel.model.Driver;
import com.ecotravel.model.Trip;

@Stateless
public class TripService {
	
	@Inject
	private TripDAO tripDAO;
	
	public List<Trip> getTripByDriverId(Driver driver) {
		return tripDAO.findTripsByDriverId(driver);
	}
	
	public Trip addNewTrip(Trip trip) {
		return tripDAO.save(trip);
	}
	
	public List<Trip> findMatchingTrips(String from, String to, Date date) {
		if (from.length() > 0 && to.length() > 0) {
			return tripDAO.findTripsByTowns(from, to);
		}
//		else if (date != null) {
//			return tripDAO.findTripsByDate(date);
//		}
		
		return new ArrayList<Trip>();
	}
	
	public Trip getTripById(Long id) {
		return tripDAO.find(id);
	}
	
	public void deleteTrip(Trip trip) {
		tripDAO.remove(trip);
	}
	
	public Trip editTrip(Trip trip) {
		return tripDAO.save(trip);
	}
}
