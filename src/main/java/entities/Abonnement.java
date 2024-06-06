package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;


/**
 * The persistent class for the abonnement database table.
 * 
 */
@Entity
@NamedQuery(name="Abonnement.findAll", query="SELECT a FROM Abonnement a")
public class Abonnement implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int abonnementId;

	private Byte abonnementEtat;

	private int abonnementProp;

	@Temporal(TemporalType.DATE)
	private Date debutDate;

	@Temporal(TemporalType.DATE)
	private Date finDate;

	//bi-directional many-to-one association to Offre
	@ManyToOne
	@JoinColumn(name="abonnementType")
	private Offre offre;

	public Abonnement() {
	}

	public int getAbonnementId() {
		return this.abonnementId;
	}

	public void setAbonnementId(int abonnementId) {
		this.abonnementId = abonnementId;
	}

	public byte getAbonnementEtat() {
		return this.abonnementEtat;
	}

	public void setAbonnementEtat(byte abonnementEtat) {
		this.abonnementEtat = abonnementEtat;
	}

	public int getAbonnementProp() {
		return this.abonnementProp;
	}

	public void setAbonnementProp(int abonnementProp) {
		this.abonnementProp = abonnementProp;
	}

	public Date getDebutDate() {
		return this.debutDate;
	}

	public void setDebutDate(Date debutDate) {
		this.debutDate = debutDate;
	}

	public Date getFinDate() {
		return this.finDate;
	}

	public void setFinDate(Date finDate) {
		this.finDate = finDate;
	}

	public Offre getOffre() {
		return this.offre;
	}

	public void setOffre(Offre offre) {
		this.offre = offre;
	}

}