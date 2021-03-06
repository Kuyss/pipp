package hr.fer.pipp.sza.webapp.modeli;

import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "pitanja")
public class Pitanje {

	@Id
	@GeneratedValue
	@Expose
	private long idPitanje;

	@ManyToOne
	private Anketa anketa;

	@Expose
	@Column(nullable = false)
	private int rbrPitanje;

	@Expose
	@Column(nullable = false)
	private String textPitanje;

	@Expose
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "pitanje", orphanRemoval = true)
	private List<Odgovor> odgovor;

	public Pitanje() {
	}

	public Pitanje(int rbrPitanje, String textPitanje, Anketa anketa) {

		this.anketa = anketa;
		this.rbrPitanje = rbrPitanje;
		this.textPitanje = textPitanje;
	}

	public List<Odgovor> getOdgovor() {
		return odgovor;
	}

	public void setOdgovor(List<Odgovor> odgovor) {
		this.odgovor = odgovor;
	}

	public long getIdPitanje() {
		return idPitanje;
	}

	public void setIdPitanje(long idPitanje) {
		this.idPitanje = idPitanje;
	}

	public Anketa getAnketa() {
		return anketa;
	}

	public void setAnketa(Anketa anketa) {
		this.anketa = anketa;
	}

	public int getRbrPitanje() {
		return rbrPitanje;
	}

	public void setRbrPitanje(int rbrPitanje) {
		this.rbrPitanje = rbrPitanje;
	}

	public String getTextPitanje() {
		return textPitanje;
	}

	public void setTextPitanje(String textPitanje) {
		this.textPitanje = textPitanje;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (idPitanje ^ (idPitanje >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pitanje other = (Pitanje) obj;
		if (idPitanje != other.idPitanje)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Pitanje [rbrPitanje=" + rbrPitanje + ", textPitanje=" + textPitanje + ", odgovor="
				+ Arrays.toString(odgovor.toArray()) + "]";
	}

}
