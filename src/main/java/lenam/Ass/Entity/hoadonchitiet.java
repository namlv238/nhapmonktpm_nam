package lenam.Ass.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.core.sym.Name;

@Entity
@Table(name = "hoadonchitiet")
public class hoadonchitiet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mahoadonchitiet;

	@ManyToOne
	@JoinColumn(name = "mahoadon")
	private hoadon hoadons;

	@ManyToOne
	@JoinColumn(name = "masanpham")
	private sanpham sanphams;
	private Integer soluong;

	public hoadonchitiet() {
		// TODO Auto-generated constructor stub
	}

	public hoadonchitiet(hoadon hoadons, sanpham sanphams, Integer soluong) {
		super();

		this.hoadons = hoadons;
		this.sanphams = sanphams;
		this.soluong = soluong;
	}

	public Integer getMahoadonchitiet() {
		return mahoadonchitiet;
	}

	public void setMahoadonchitiet(Integer mahoadonchitiet) {
		this.mahoadonchitiet = mahoadonchitiet;
	}

	public hoadon getHoadons() {
		return hoadons;
	}

	public void setHoadons(hoadon hoadons) {
		this.hoadons = hoadons;
	}

	public sanpham getSanphams() {
		return sanphams;
	}

	public void setSanphams(sanpham sanphams) {
		this.sanphams = sanphams;
	}

	public Integer getSoluong() {
		return soluong;
	}

	public void setSoluong(Integer soluong) {
		this.soluong = soluong;
	}

}
