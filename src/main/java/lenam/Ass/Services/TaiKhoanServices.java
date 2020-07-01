package lenam.Ass.Services;

import java.util.List;
import java.util.Optional;

import lenam.Ass.Entity.taikhoan;

public interface TaiKhoanServices {

	void deleteById(String id);

	List<taikhoan> findAll();

	taikhoan findById(String id);

	taikhoan save(taikhoan entity);

}
