package entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.Date;


/**
 * The persistent class for the client database table.
 * 
 */
@Entity
@NamedQuery(name="Client.findAll", query="SELECT c FROM Client c")
public class Client implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int clientId;

	@Temporal(TemporalType.DATE)
	private Date clientDatenais;

	@Lob
	private String clientEmail;

	@Lob
	private String clientNom;

	@Lob
	private String clientPass;

	@Lob
	private String clientPrenom;

	private int clientTel;

	public Client() {
	}

	public int getClientId() {
		return this.clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public Date getClientDatenais() {
		return this.clientDatenais;
	}

	public void setClientDatenais(Date clientDatenais) {
		this.clientDatenais = clientDatenais;
	}

	public String getClientEmail() {
		return this.clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public String getClientNom() {
		return this.clientNom;
	}

	public void setClientNom(String clientNom) {
		this.clientNom = clientNom;
	}

	public String getClientPass() {
		return this.clientPass;
	}

	public void setClientPass(String clientPass) {
		this.clientPass = clientPass;
	}

	public String getClientPrenom() {
		return this.clientPrenom;
	}

	public void setClientPrenom(String clientPrenom) {
		this.clientPrenom = clientPrenom;
	}

	public int getClientTel() {
		return this.clientTel;
	}

	public void setClientTel(int clientTel) {
		this.clientTel = clientTel;
	}

}