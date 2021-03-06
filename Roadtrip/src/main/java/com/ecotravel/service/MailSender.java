package com.ecotravel.service;

import java.util.Properties;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ecotravel.dao.ProfileDAO;
import com.ecotravel.model.Profile;
import com.ecotravel.utils.AuthenticationUtils;
import com.ecotravel.utils.Emailer;
import com.ecotravel.utils.RandomStringGenerator;

@Stateless
public class MailSender {
	
	@Inject
	private ProfileDAO profileDao;
	
	private Emailer emailer = new Emailer();
	private Session session = emailer.getSession();
	private Properties props = emailer.getProps();
	String subject;
	String emailText;
	Message message;
	
	public boolean sendMessage(String username){		
			this.setSubject("Generating new Password");
			this.setEmailText("Be more careful next time! \n Your new password is: ");

			Profile userProfile = profileDao.findByUsername(username); 
			
			String email = userProfile.getEmail();
			if(email == null)
				return false;
			String newPassword = RandomStringGenerator.generateRandomString();
			userProfile.setPassword(AuthenticationUtils.getHashedPassword(newPassword));
			profileDao.save(userProfile);
			this.emailText = emailText + newPassword + "\nGreetings, Road Trip team!";	
			
			this.configurateAndTransportMessage(email, emailText);
			return true;
	}
	
	public void sendTripEmail(String driverEmail, String passengerEmail, String passengerUsername){		
			this.setSubject("Passengers for your trip");
			this.setEmailText(emailText = "The user with username: ");


			
			
			emailText = emailText + passengerUsername + " wants to trip with you! " + 
			 "You can contact him at " + passengerEmail;		
			this. configurateAndTransportMessage(driverEmail, emailText);
	}
	
	private void setSubject(String subject){
		if(subject != null)
			this.subject = subject;
	}
	
	private void setEmailText(String emailText){
		if(emailText != null)
			this.emailText = emailText;
	}
	
	private void configurateAndTransportMessage(String email, String emailText){
		try{
			this.message = new MimeMessage(session);
			message.setFrom(new InternetAddress("roadtriptrop@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(email));
			message.setSubject(subject);
			message.setText(emailText);
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
