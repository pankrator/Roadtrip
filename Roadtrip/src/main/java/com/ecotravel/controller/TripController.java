package com.ecotravel.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import com.ecotravel.context.UserContext;
import com.ecotravel.model.Driver;
import com.ecotravel.model.Profile;
import com.ecotravel.model.Trip;
import com.ecotravel.service.MailSender;
import com.ecotravel.service.ProfileService;
import com.ecotravel.service.TripService;

@Stateless
@Path("trip")
public class TripController {
	
	@Inject
	private TripService tripService;
	
	@Inject 
	private ProfileService profileService;
	
	@Inject
	private MailSender mailSender;
	
	@Inject
	private UserContext userContext;
	
	@GET
	@Produces("application/json")
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/trip.jsp");
		
		rd.forward(request, response);
	}
	
	@GET
	@Produces("application/json")
	@Path("/tripSearch")
	public void goToSearchPage(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/tripSearch.jsp");
		
		rd.forward(request, response);
	}
	
	@POST
	@Consumes("application/x-www-form-urlencoded")
	public void createTrip(@Context HttpServletRequest request, @Context HttpServletResponse response,
					 @FormParam(value="fromCity") String travelFrom,
					 @FormParam(value="toCity") String travelTo,
					 @FormParam(value="date") String date,
					 @FormParam(value="time") String time,
					 @FormParam(value="freePlaces") int freePlaces) throws ServletException, IOException {
		
		Trip trip = new Trip();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date departureTime = null;
		try {
			departureTime = formatter.parse(date + " " + time);
			System.out.println(departureTime);
//			System.out.println(formatter.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
				
		trip.setDepartureTime(departureTime);
		trip.setDriver((Driver)userContext.getProfile().getPerson());
		trip.setFreePlaces(freePlaces);
		trip.setTravelFrom(travelFrom);
		trip.setTravelTo(travelTo);
		
		tripService.addNewTrip(trip);
		response.sendRedirect(request.getContextPath() + "/profile");
	}
	
	@GET
	@Path("/searchTrip")
	public void searchTrip(@Context HttpServletRequest request, @Context HttpServletResponse response,
			 @QueryParam(value="fromCity") String fromCity,
			 @QueryParam(value="toCity") String toCity,
			 @QueryParam(value="date") String dateString) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = formatter.parse(dateString);
		} catch (ParseException e) {
			
		}
		
		List<Trip> trips = tripService.findMatchingTrips(fromCity, toCity, date);
		
		request.setAttribute("matchingTrips", trips);
		rd = request.getRequestDispatcher("/matchingTrips.jsp");
			
		rd.forward(request, response);
	}
	
	
	
	
	@GET
	@Path("/editTrip") // no actual edit -> just forward
	@Produces("application/json")
	public void getEditTripPage(@Context HttpServletRequest request, @Context HttpServletResponse response,
			@FormParam(value="tripId") Long tripId) throws ServletException, IOException {
		
		System.out.println("trip id is: " + tripId);
		
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/tripEdit.jsp");
		
		request.setAttribute("tripId", tripId);
		
		Trip trip = new Trip();
		trip = tripService.getTripById(tripId);
		
		request.setAttribute("tripToEdit", trip);
		
		rd.forward(request, response);
	}
	
	
	// handles request from tripEdit page; actual editing
	@POST
	@Path("/submitTripChanges")
	@Consumes("application/x-www-form-urlencoded")
	public void createTrip(@Context HttpServletRequest request, @Context HttpServletResponse response,
			@FormParam(value="freePlaces") int freePlaces, 
			@FormParam(value="tripId") Long tripId) throws ServletException, IOException {
		
		System.out.println("free places: " + freePlaces);
		System.out.println("tripId: " + tripId);
		
		//TODO: validate input data
		
		Trip trip = tripService.getTripById(tripId);
		trip.setFreePlaces(freePlaces);
	
		// Update DB:
		tripService.editTrip(trip);
		
		response.sendRedirect(request.getContextPath() + "/profile");
	}
	
	
	@POST
	@Path("/deleteTrip")
	@Consumes("application/x-www-form-urlencoded")
	public void deleteTrip(@Context HttpServletRequest request, @Context HttpServletResponse response,
			@FormParam(value="tripId") Long tripId) throws ServletException, IOException {
		
		System.out.println("Trip id is: " + tripId);
		
		Trip trip = tripService.getTripById(tripId);
		tripService.deleteTrip(trip);
		
		System.out.println("trip " + tripId + " deleted.");
		
		response.sendRedirect(request.getContextPath() + "/profile");
	}
	
	
	@POST
	@Path("/subscribeForTrip")
	@Consumes("application/x-www-form-urlencoded")
	public void subscribeForTrip(@Context HttpServletRequest request, @Context HttpServletResponse response,
			@FormParam(value="tripId") Long tripId) throws ServletException, IOException {
		Trip trip = tripService.getTripById(tripId);
		Driver driver = trip.getDriver();
		Profile driverProfile = profileService.getProfileByPerson(driver);
		String driverEmail = driverProfile.getEmail();
		
		String passengerEmail = userContext.getProfile().getEmail();
		String passengerUsername = userContext.getProfile().getUsername();
		
		mailSender.sendTripEmail(driverEmail, passengerEmail, passengerUsername);
		
		response.sendRedirect(request.getContextPath() + "/profile");
	}
	
}
