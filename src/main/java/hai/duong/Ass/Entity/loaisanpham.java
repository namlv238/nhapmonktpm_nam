package hai.duong.Ass.Entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "loaisanpham")
public class loaisanpham {

	@Id
	private String maloaisanpham;
	private String tenloaisanpham;
	@OneToMany(mappedBy = "loaisanphams", fetch = FetchType.EAGER)
	private Collection<sanpham> sanphams;

	public loaisanpham() {
		// TODO Auto-generated constructor stub
	}

	public loaisanpham(String maloaisanpham, String tenloaisanpham, Collection<sanpham> sanphams) {
		super();
		this.maloaisanpham = maloaisanpham;
		this.tenloaisanpham = tenloaisanpham;
		this.sanphams = sanphams;
	}

	public String getMaloaisanpham() {
		return maloaisanpham;
	}

	public void setMaloaisanpham(String maloaisanpham) {
		this.maloaisanpham = maloaisanpham;
	}

	public String getTenloaisanpham() {
		return tenloaisanpham;
	}

	public void setTenloaisanpham(String tenloaisanpham) {
		this.tenloaisanpham = tenloaisanpham;
	}

	public Collection<sanpham> getSanphams() {
		return sanphams;
	}

	public void setSanphams(Collection<sanpham> sanphams) {
		this.sanphams = sanphams;
	}

}
