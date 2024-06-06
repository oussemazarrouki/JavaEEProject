package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;


/**
 * The persistent class for the offre database table.
 * 
 */
@Entity
@NamedQuery(name="Offre.findAll", query="SELECT o FROM Offre o")
public class Offre implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int offreId;

	@Lob
	private String offreDetail;

	private String offreNom;

	private float offrePrix;

	//bi-directional many-to-one association to Abonnement
	@OneToMany(mappedBy="offre", fetch=FetchType.EAGER)
	private List<Abonnement> abonnements;

	//bi-directional many-to-one association to Cour
	@ManyToOne
	@JoinColumn(name="offreCour")
	private Cour cour;

	public Offre() {
	}

	public int getOffreId() {
		return this.offreId;
	}

	public void setOffreId(int offreId) {
		this.offreId = offreId;
	}

	public String getOffreDetail() {
		return this.offreDetail;
	}

	public void setOffreDetail(String offreDetail) {
		this.offreDetail = offreDetail;
	}

	public String getOffreNom() {
		return this.offreNom;
	}

	public void setOffreNom(String offreNom) {
		this.offreNom = offreNom;
	}

	public float getOffrePrix() {
		return this.offrePrix;
	}

	public void setOffrePrix(float offrePrix) {
		this.offrePrix = offrePrix;
	}

	public List<Abonnement> getAbonnements() {
		return this.abonnements;
	}

	public void setAbonnements(List<Abonnement> abonnements) {
		this.abonnements = abonnements;
	}

	public Abonnement addAbonnement(Abonnement abonnement) {
		getAbonnements().add(abonnement);
		abonnement.setOffre(this);

		return abonnement;
	}

	public Abonnement removeAbonnement(Abonnement abonnement) {
		getAbonnements().remove(abonnement);
		abonnement.setOffre(null);

		return abonnement;
	}

	public Cour getCour() {
		return this.cour;
	}

	public void setCour(Cour cour) {
		this.cour = cour;
	}

}