package entities;

import java.io.Serializable;
import jakarta.persistence.*;


/**
 * The persistent class for the calendrier database table.
 * 
 */
@Entity
@NamedQuery(name="Calendrier.findAll", query="SELECT c FROM Calendrier c")
public class Calendrier implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int activiteId;

	private String activiteJour;

	private String activiteTemps;

	//bi-directional many-to-one association to Cour
	@ManyToOne
	@JoinColumn(name="activiteCour")
	private Cour cour;

	public Calendrier() {
	}

	public int getActiviteId() {
		return this.activiteId;
	}

	public void setActiviteId(int activiteId) {
		this.activiteId = activiteId;
	}

	public String getActiviteJour() {
		return this.activiteJour;
	}

	public void setActiviteJour(String activiteJour) {
		this.activiteJour = activiteJour;
	}

	public String getActiviteTemps() {
		return this.activiteTemps;
	}

	public void setActiviteTemps(String activiteTemps) {
		this.activiteTemps = activiteTemps;
	}

	public Cour getCour() {
		return this.cour;
	}

	public void setCour(Cour cour) {
		this.cour = cour;
	}

}