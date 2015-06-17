package com.ecotravel.controller;

import java.io.IOException;
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
import javax.ws.rs.core.Context;

import com.ecotravel.enums.PersonType;

import slbedu.library.context.UserContext;
import slbedu.library.model.Driver;
import slbedu.library.model.Passenger;
import slbedu.library.model.Person;
import slbedu.library.model.Profile;
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
	
	
	
	// Editing personal profile:
	@GET
	@Path("/profileEdit")
	@Produces("application/json")
	public void getProfileEditPage(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/profileEdit.jsp");
		
		rd.forward(request, response);
	}
	
	// this method edits profile if user is passenger
	@POST
	@Path("/profileEdit/passenger")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void postPassenger(@Context HttpServletRequest request, @Context HttpServletResponse response,@FormParam(value="username") String username,
			 @FormParam(value="name") String name,
			 @FormParam(value="birthYear") int birthYear,
			 @FormParam(value="telephone") String telephone,
			 @FormParam(value="password") String password,
			 @FormParam(value="confirm_password") String password2) throws ServletException, IOException {

		RequestDispatcher rd = null;
		
		// TODO: 
		// validate parameters
		// set error messages -> request.setAttribute()
		// save changes into DB
		
		System.out.println("IN PROFILE_EDIT_PASSENGER CONTROLLER");
		
		rd = request.getRequestDispatcher("profile.jsp");
		rd.forward(request, response);

	}
	
	// this method edits profile if user is driver
	@POST
	@Path("/profileEdit/driver")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void postDriver(@Context HttpServletRequest request, @Context HttpServletResponse response,@FormParam(value="username") String username,
			 @FormParam(value="name") String name,
			 @FormParam(value="birthYear") int birthYear,
			 @FormParam(value="telephone") String telephone,
			 @FormParam(value="password") String password,
			 @FormParam(value="confirm_password") String password2,
			 @FormParam(value="isSmoking") String smoking,
			 @FormParam(value="musicInTheCar") String music) throws ServletException, IOException {

		RequestDispatcher rd = null;		
		
		// TODO: 
		// validate parameters
		// set error messages -> request.setAttribute()
		// save changes into DB
		
		System.out.println("IN PROFILE_EDIT_DRIVER CONTROLLER");

		rd = request.getRequestDispatcher("profile.jsp");
		rd.forward(request, response);
		
	}
	
}
