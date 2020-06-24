package hai.duong.Ass.Entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sanpham")
public class sanpham {
	@Id
	private String masanpham;
	private String tensanpham;
	private Integer giasanpham;
	private String hinhanh;
	@ManyToOne
	@JoinColumn(name = "maloaisanpham")
	private loaisanpham loaisanphams;

	@OneToMany(mappedBy = "sanphams", fetch = FetchType.EAGER)
	private Collection<hoadonchitiet> hoadonchitiets;

	public sanpham() {
		// TODO Auto-generated constructor stub
	}

	public sanpham(String masanpham, String tensanpham, Integer giasanpham, String hinhanh, loaisanpham loaisanphams,
			Collection<hoadonchitiet> hoadonchitiets) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.giasanpham = giasanpham;
		this.hinhanh = hinhanh;
		this.loaisanphams = loaisanphams;
		this.hoadonchitiets = hoadonchitiets;
	}

	public String getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public Integer getGiasanpham() {
		return giasanpham;
	}

	public void setGiasanpham(Integer giasanpham) {
		this.giasanpham = giasanpham;
	}

	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public loaisanpham getLoaisanphams() {
		return loaisanphams;
	}

	public void setLoaisanphams(loaisanpham loaisanphams) {
		this.loaisanphams = loaisanphams;
	}

	public Collection<hoadonchitiet> getHoadonchitiets() {
		return hoadonchitiets;
	}

	public void setHoadonchitiets(Collection<hoadonchitiet> hoadonchitiets) {
		this.hoadonchitiets = hoadonchitiets;
	}

}
