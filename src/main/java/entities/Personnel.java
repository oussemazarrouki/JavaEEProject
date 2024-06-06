package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;


/**
 * The persistent class for the personnel database table.
 * 
 */
@Entity
@NamedQuery(name="Personnel.findAll", query="SELECT p FROM Personnel p")
public class Personnel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int personnelId;

	private String personnelEmail;

	private String personnelNom;

	private String personnelPass;

	private String personnelPrenom;

	private String personnelRole;

	//bi-directional many-to-one association to Cour
	@OneToMany(mappedBy="personnel", fetch=FetchType.EAGER)
	private List<Cour> cours;

	public Personnel() {
	}

	public int getPersonnelId() {
		return this.personnelId;
	}

	public void setPersonnelId(int personnelId) {
		this.personnelId = personnelId;
	}

	public String getPersonnelEmail() {
		return this.personnelEmail;
	}

	public void setPersonnelEmail(String personnelEmail) {
		this.personnelEmail = personnelEmail;
	}

	public String getPersonnelNom() {
		return this.personnelNom;
	}

	public void setPersonnelNom(String personnelNom) {
		this.personnelNom = personnelNom;
	}

	public String getPersonnelPass() {
		return this.personnelPass;
	}

	public void setPersonnelPass(String personnelPass) {
		this.personnelPass = personnelPass;
	}

	public String getPersonnelPrenom() {
		return this.personnelPrenom;
	}

	public void setPersonnelPrenom(String personnelPrenom) {
		this.personnelPrenom = personnelPrenom;
	}

	public String getPersonnelRole() {
		return this.personnelRole;
	}

	public void setPersonnelRole(String personnelRole) {
		this.personnelRole = personnelRole;
	}

	public List<Cour> getCours() {
		return this.cours;
	}

	public void setCours(List<Cour> cours) {
		this.cours = cours;
	}

	public Cour addCour(Cour cour) {
		getCours().add(cour);
		cour.setPersonnel(this);

		return cour;
	}

	public Cour removeCour(Cour cour) {
		getCours().remove(cour);
		cour.setPersonnel(null);

		return cour;
	}

}