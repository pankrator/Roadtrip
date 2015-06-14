package slbedu.library.services;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;

import slbedu.library.dao.TripDAO;
import slbedu.library.model.Driver;
import slbedu.library.model.Trip;

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
	
	
	public List<Trip> findMatchingTrips(Trip trip){
		return tripDAO.findTripsByTownsAndDate(trip);
	}
}
