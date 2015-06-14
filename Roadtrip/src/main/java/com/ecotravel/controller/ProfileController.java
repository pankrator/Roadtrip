package com.ecotravel.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import slbedu.library.context.UserContext;
import slbedu.library.model.Driver;
import slbedu.library.model.Passenger;
import slbedu.library.model.Trip;
import slbedu.library.services.TripService;

@Stateless
@Path("profile")
public class ProfileController {
	
	@Inject
	private TripService tripService;
	
	@Inject
	private UserContext context;
	
	@GET
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/profile.jsp");
		
		if (context.getProfile().getPerson() instanceof Driver) {
			Driver driver = (Driver) context.getProfile().getPerson();
			List<Trip> trips = tripService.getTripByDriverId(driver);
			request.setAttribute("tripsList", trips);			
		} else {
//			Passenger passenger = (Passenger) context.getProfile().getPerson();
		}
		
		rd.forward(request, response);
	}
	
}
