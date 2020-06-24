package hai.duong.Ass.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "giohang")
public class giohang {
	
	@Id
	private String id;
	private String dsgiohang;
	public giohang() {
		// TODO Auto-generated constructor stub
	}
	public giohang(String id, String dsgiohang) {
		super();
		this.id = id;
		this.dsgiohang = dsgiohang;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDsgiohang() {
		return dsgiohang;
	}
	public void setDsgiohang(String dsgiohang) {
		this.dsgiohang = dsgiohang;
	}
	

}
