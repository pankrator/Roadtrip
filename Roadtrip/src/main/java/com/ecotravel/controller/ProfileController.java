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

import slbedu.library.context.UserContext;
import slbedu.library.model.Driver;
import slbedu.library.model.Passenger;
import slbedu.library.model.Person;
import slbedu.library.model.Profile;
import slbedu.library.model.Trip;
import slbedu.library.services.ProfileService;
import slbedu.library.services.TripService;

@Stateless
@Path("profile")
public class ProfileController {
	
	@Inject
	private TripService tripService;
	
	@Inject
	private ProfileService profileService;
	
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
	
	// edits profile if user is passenger
	@POST
	@Path("/profileEditPassenger")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void postPassenger(@Context HttpServletRequest request, @Context HttpServletResponse response,
			 @FormParam(value="name") String name,
			 @FormParam(value="birthYear") int birthYear,
			 @FormParam(value="telephone") String telephone,
			 @FormParam(value="password") String password,
			 @FormParam(value="rePassword") String password2) throws ServletException, IOException {

		// just to be sure we get all parameters correctly
		System.out.println(name);
		System.out.println(birthYear);
		System.out.println(telephone);
		System.out.println(password);
		System.out.println(password2);
		System.out.println("IN PROFILE_EDIT_PASSENGER CONTROLLER");
		
		// TODO: 
		// validate parameters
		// set error messages -> request.setAttribute()
		
		RequestDispatcher rd = null;
		
		if (!password.equals(password2)) {
			request.setAttribute("confirm_error_msg", "Password mismatch!");
			rd = request.getRequestDispatcher("/profileEdit.jsp");
			rd.forward(request, response);
		} else {
			Person person = new Passenger();
			person.setName(name);
			person.setBirthYear(birthYear);
			person.setTelephone(telephone);
			
			Profile profile = new Profile();
			profile.setPassword(password);
		
			profileService.editProfile(profile, person);
			
			response.sendRedirect("/Roadtrip/profile"); 
		}

	}
	
	// edits profile if user is driver
	@POST
	@Path("profileEditDriver")
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public void postDriver(@Context HttpServletRequest request, @Context HttpServletResponse response,
			 @FormParam(value="name") String name,
			 @FormParam(value="birthYear") int birthYear,
			 @FormParam(value="telephone") String telephone,
			 @FormParam(value="password") String password,
			 @FormParam(value="rePassword") String password2,
			 @FormParam(value="isSmoking") String smoking,
			 @FormParam(value="musicInTheCar") String music) throws ServletException, IOException {
		
		// just to be sure we get all parameters correctly
		System.out.println(name);
		System.out.println(birthYear);
		System.out.println(telephone);
		System.out.println(password);
		System.out.println(password2);
		System.out.println(smoking);
		System.out.println(music);
		System.out.println("IN PROFILE_EDIT_DRIVER CONTROLLER");
		
		// TODO: 
		// validate parameters
		// set error messages -> request.setAttribute()
		
		RequestDispatcher rd = null;
		
		if (!password.equals(password2)) {
			request.setAttribute("confirm_error_msg", "Password mismatch!");
			rd = request.getRequestDispatcher("/profileEdit.jsp");
			rd.forward(request, response);
		} else {
			Profile profile = context.getProfile();
			Driver person = (Driver)profile.getPerson();
			person.setName(name);
			person.setBirthYear(birthYear);
			person.setTelephone(telephone);
			person.setMusicInTheCar(music);
//			person.setSmoking(smoking);
			
			profile.setPassword(password);
			
			// TODO:
			// set isSmoking ???
			// set music ???
			
			profileService.editProfile(profile, person);
			
			response.sendRedirect("/Roadtrip/profile"); 
		}
		
	}
	
}
