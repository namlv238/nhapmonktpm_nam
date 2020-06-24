package hai.duong.Ass.Entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "hoadon")
public class hoadon {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer mahoadon;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date ngayhoadon;
	@OneToMany(mappedBy = "hoadons",fetch =FetchType.EAGER)
	private Collection<hoadonchitiet> hoadonchitiets;
	private String trangthai ;
	private String ghichu;
	
	@ManyToOne
	@JoinColumn(name = "tendangnhap")
	private taikhoan taikhoans;
	public hoadon() {
		// TODO Auto-generated constructor stub
	}
	public hoadon(Integer mahoadon, Date ngayhoadon, Collection<hoadonchitiet> hoadonchitiets, String trangthai,
			String ghichu, taikhoan taikhoans) {
		super();
		this.mahoadon = mahoadon;
		this.ngayhoadon = ngayhoadon;
		this.hoadonchitiets = hoadonchitiets;
		this.trangthai = trangthai;
		this.ghichu = ghichu;
		this.taikhoans = taikhoans;
	}
	
	
	public hoadon(Date ngayhoadon, String trangthai,
			String ghichu, taikhoan taikhoans) {
		super();
	
		this.ngayhoadon = ngayhoadon;
	
		this.trangthai = trangthai;
		this.ghichu = ghichu;
		this.taikhoans = taikhoans;
	}
	public Integer getMahoadon() {
		return mahoadon;
	}
	public void setMahoadon(Integer mahoadon) {
		this.mahoadon = mahoadon;
	}
	public Date getNgayhoadon() {
		return ngayhoadon;
	}
	public void setNgayhoadon(Date ngayhoadon) {
		this.ngayhoadon = ngayhoadon;
	}
	public Collection<hoadonchitiet> getHoadonchitiets() {
		return hoadonchitiets;
	}
	public void setHoadonchitiets(Collection<hoadonchitiet> hoadonchitiets) {
		this.hoadonchitiets = hoadonchitiets;
	}
	public String getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}
	public String getGhichu() {
		return ghichu;
	}
	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}
	public taikhoan getTaikhoans() {
		return taikhoans;
	}
	public void setTaikhoans(taikhoan taikhoans) {
		this.taikhoans = taikhoans;
	}
	

	
	

}
