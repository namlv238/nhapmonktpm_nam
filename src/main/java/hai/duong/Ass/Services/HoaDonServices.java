package hai.duong.Ass.Services;

import java.util.List;

import hai.duong.Ass.Entity.hoadon;

public interface HoaDonServices {

	void deleteById(Integer id);

	List<hoadon> findAll();

	hoadon findById(Integer id);

	hoadon save(hoadon entity);

}
