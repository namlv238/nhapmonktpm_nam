package lenam.Ass.Services;

import java.util.List;

import lenam.Ass.Entity.giohang;

public interface GioHangServices {

	void deleteById(String id);

	List<giohang> findAll();

	giohang findById(String id);

	giohang save(giohang entity);

}
