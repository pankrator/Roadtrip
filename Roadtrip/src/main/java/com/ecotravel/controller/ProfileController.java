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
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import slbedu.library.context.UserContext;
import slbedu.library.dao.PersonDAO;
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
	
	@Inject
	private PersonDAO personDao;
	
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
	
	@GET
	@Path("/user/{id}")
	public void viewProfile(@Context HttpServletRequest request, 
							@Context HttpServletResponse response,
							@PathParam("id") Long id) throws ServletException, IOException {
		
		Person person = personDao.findById(id);
		Profile profile = profileService.getProfileByPerson(person);
		
		request.setAttribute("profile", profile);
		
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("/viewProfile.jsp");
		
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
		
		RequestDispatcher rd = null;
		
		if (!password.equals(password2)) {
			request.setAttribute("confirm_error_msg", "Password mismatch!");
			rd = request.getRequestDispatcher("/profileEdit.jsp");
			rd.forward(request, response);
		} else {
			Profile profile = context.getProfile();
			Passenger person = (Passenger)profile.getPerson();
			person.setName(name);
			person.setBirthYear(birthYear);
			person.setTelephone(telephone);
			
			profile.setPassword(password);
		
			profileService.editProfile(profile, person);
			
			response.sendRedirect(request.getContextPath() + "/profile"); 
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
			 @FormParam(value="licenseYear") int licenseYear,
			 @FormParam(value="password") String password,
			 @FormParam(value="rePassword") String password2,
			 @FormParam(value="isSmoking") String smoking,
			 @FormParam(value="musicInTheCar") String music) throws ServletException, IOException {
		
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
			person.setLicenseYear(licenseYear);
			person.setMusicInTheCar(music);
			
			if (smoking == "Yes") {
				person.setSmoking(true);
			} else {
				person.setSmoking(false);
			}
			
			profile.setPassword(password);
			
			profileService.editProfile(profile, person);
			
			response.sendRedirect(request.getContextPath() + "/profile"); 
		}
		
	}
	
}
