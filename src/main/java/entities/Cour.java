package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;


/**
 * The persistent class for the cour database table.
 * 
 */
@Entity
@NamedQuery(name="Cour.findAll", query="SELECT c FROM Cour c")
public class Cour implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int courId;

	@Lob
	private String courDetail;

	private String courNom;

	//bi-directional many-to-one association to Calendrier
	@OneToMany(mappedBy="cour", fetch=FetchType.EAGER)
	private List<Calendrier> calendriers;

	//bi-directional many-to-one association to Personnel
	@ManyToOne
	@JoinColumn(name="courCoach")
	private Personnel personnel;

	//bi-directional many-to-one association to Offre
	@OneToMany(mappedBy="cour", fetch=FetchType.EAGER)
	private List<Offre> offres;

	public Cour() {
	}

	public int getCourId() {
		return this.courId;
	}

	public void setCourId(int courId) {
		this.courId = courId;
	}

	public String getCourDetail() {
		return this.courDetail;
	}

	public void setCourDetail(String courDetail) {
		this.courDetail = courDetail;
	}

	public String getCourNom() {
		return this.courNom;
	}

	public void setCourNom(String courNom) {
		this.courNom = courNom;
	}

	public List<Calendrier> getCalendriers() {
		return this.calendriers;
	}

	public void setCalendriers(List<Calendrier> calendriers) {
		this.calendriers = calendriers;
	}

	public Calendrier addCalendrier(Calendrier calendrier) {
		getCalendriers().add(calendrier);
		calendrier.setCour(this);

		return calendrier;
	}

	public Calendrier removeCalendrier(Calendrier calendrier) {
		getCalendriers().remove(calendrier);
		calendrier.setCour(null);

		return calendrier;
	}

	public Personnel getPersonnel() {
		return this.personnel;
	}

	public void setPersonnel(Personnel personnel) {
		this.personnel = personnel;
	}

	public List<Offre> getOffres() {
		return this.offres;
	}

	public void setOffres(List<Offre> offres) {
		this.offres = offres;
	}

	public Offre addOffre(Offre offre) {
		getOffres().add(offre);
		offre.setCour(this);

		return offre;
	}

	public Offre removeOffre(Offre offre) {
		getOffres().remove(offre);
		offre.setCour(null);

		return offre;
	}

}