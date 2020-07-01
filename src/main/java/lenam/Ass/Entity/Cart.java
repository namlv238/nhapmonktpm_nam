package lenam.Ass.Entity;

import java.io.Serializable;

public class Cart implements Serializable{
	
	private sanpham sp;
	private int soluong;
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	public Cart(sanpham sp, int soluong) {
		super();
		this.sp = sp;
		this.soluong = soluong;
	}
	public sanpham getSp() {
		return sp;
	}
	public void setSp(sanpham sp) {
		this.sp = sp;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	public int tongTien() {
		return sp.getGiasanpham()*soluong;
	}
	
	
	

}
