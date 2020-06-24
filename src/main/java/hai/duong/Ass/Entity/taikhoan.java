package hai.duong.Ass.Entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "taikhoan")
public class taikhoan {

	@Id
	private String tendangnhap;
	private String matkhau;
	private String hoten;
	private String email;
	private String diachi;
	private String gioitinh;
	private String chucnang;

	@OneToMany(mappedBy = "taikhoans", fetch = FetchType.EAGER)
	private Collection<hoadon> hoadons;

	public taikhoan() {
		// TODO Auto-generated constructor stub
	}

	public taikhoan(String tendangnhap, String matkhau, String hoten, String email, String diachi, String gioitinh,
			String chucnang, Collection<hoadon> hoadons) {
		super();
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
		this.hoten = hoten;
		this.email = email;
		this.diachi = diachi;
		this.gioitinh = gioitinh;
		this.chucnang = chucnang;
		this.hoadons = hoadons;
	}

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}

	public String getChucnang() {
		return chucnang;
	}

	public void setChucnang(String chucnang) {
		this.chucnang = chucnang;
	}

	public Collection<hoadon> getHoadons() {
		return hoadons;
	}

	public void setHoadons(Collection<hoadon> hoadons) {
		this.hoadons = hoadons;
	}

}
