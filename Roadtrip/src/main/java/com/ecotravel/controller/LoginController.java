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
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import slbedu.library.dao.DriverDAO;
import slbedu.library.model.Driver;

@Stateless
@Path("login")
public class LoginController {
	
	@Inject
    private DriverDAO driverDAO;
	
	@GET
	@Produces("application/json")
	public void index(@Context HttpServletRequest request, @Context HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		driverDAO.add();
		List<Driver> drivers = driverDAO.findAll();
		System.out.println(drivers.size());
		request.setAttribute("drivers", drivers);
		rd = request.getRequestDispatcher("../login.jsp");
		
		rd.forward(request, response);
	}
}
