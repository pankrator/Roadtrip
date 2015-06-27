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

import slbedu.library.context.UserContext;
import slbedu.library.model.Driver;
import slbedu.library.model.Trip;
import slbedu.library.services.TripService;

@Stateless
@Path("trip")
public class TripController {
	
	@Inject
	private TripService tripService;
	
	@Inject
	private UserContext userContext;
	
	@GET
	@Produces("application/json")
	@Path("/trip")
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
	
	@GET
	@Produces("application/json")
	@Path("/driverMainPage")
	public void goToDriverMainPage(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/driverMainPage.jsp");
		
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
		
//		System.out.println(date);
//		System.out.println(time);
		
		RequestDispatcher rd = null;
		
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
			 @QueryParam(value="date") Date date) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		Trip trip = new Trip();
//		trip.setDepartureTime(date);
		trip.setTravelFrom(fromCity);
		trip.setTravelTo(toCity);
		
		List<Trip> trips = tripService.findMatchingTrips(trip);
//		if(trips != null && trips.size() > 0){
			request.setAttribute("matchingTrips", trips);
			rd = request.getRequestDispatcher("/matchingTrips.jsp");
//		//}
//		else{			
//			rd.forward(request, response);
//		}
			
		rd.forward(request, response);
	}
	
	
	
}
