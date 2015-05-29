package slbedu.library.context;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;

import slbedu.library.model.Profile;

@SessionScoped
public class UserContext implements Serializable {
	private static final long serialVersionUID = -3092442167795889039L;
	
	private Profile profile;

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
