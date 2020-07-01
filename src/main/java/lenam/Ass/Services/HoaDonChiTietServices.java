package lenam.Ass.Services;

import java.util.List;

import lenam.Ass.Entity.hoadonchitiet;

public interface HoaDonChiTietServices {

	void deleteById(Integer id);

	List<hoadonchitiet> findAll();

	hoadonchitiet findById(Integer id);

	hoadonchitiet save(hoadonchitiet entity);

}
