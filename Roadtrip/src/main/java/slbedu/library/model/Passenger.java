package slbedu.library.model;

import java.io.Serializable;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue(value = "passenger")
public class Passenger extends Person implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
}
