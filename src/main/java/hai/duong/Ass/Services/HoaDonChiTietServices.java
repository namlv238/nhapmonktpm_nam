package hai.duong.Ass.Services;

import java.util.List;

import hai.duong.Ass.Entity.hoadonchitiet;

public interface HoaDonChiTietServices {

	void deleteById(Integer id);

	List<hoadonchitiet> findAll();

	hoadonchitiet findById(Integer id);

	hoadonchitiet save(hoadonchitiet entity);

}
