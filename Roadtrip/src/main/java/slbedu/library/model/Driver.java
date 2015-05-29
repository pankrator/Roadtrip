package slbedu.library.model;

import java.io.Serializable;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@DiscriminatorValue(value = "driver")
@XmlRootElement
//@NamedQueries({
//	@NamedQuery(name = "findAll", query = "SELECT d FROM Driver d")})
public class Driver extends Person implements Serializable {
	private static final long serialVersionUID = 1L;
		
	private int numberOfTravels;
	private int licenseYear;
	private boolean isSmoking;
	private String musicInTheCar;
	
	public Driver() {
	}
	
	public Driver(String name, int rating, String telephone, int birthYear,
			int numberOfTravels, int licenseYear, boolean isSmoking,
			String musicInTheCar) {
		super(name, rating, telephone, birthYear);
		
		this.numberOfTravels = numberOfTravels;
		this.licenseYear = licenseYear;
		this.isSmoking = isSmoking;
		this.musicInTheCar = musicInTheCar;
	}

	public int getNumberOfTravels() {
		return numberOfTravels;
	}

	public void setNumberOfTravels(int numberOfTravels) {
		this.numberOfTravels = numberOfTravels;
	}

	public int getLicenseYear() {
		return licenseYear;
	}

	public void setLicenseYear(int licenseYear) {
		this.licenseYear = licenseYear;
	}

	public boolean isSmoking() {
		return isSmoking;
	}

	public void setSmoking(boolean isSmoking) {
		this.isSmoking = isSmoking;
	}

	public String getMusicInTheCar() {
		return musicInTheCar;
	}

	public void setMusicInTheCar(String musicInTheCar) {
		this.musicInTheCar = musicInTheCar;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
