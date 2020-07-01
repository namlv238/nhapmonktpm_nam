package lenam.Ass.Services;

import java.util.List;

import lenam.Ass.Entity.loaisanpham;

public interface LoaiSanPhamServices {

	void deleteById(String id);

	List<loaisanpham> findAll();

	loaisanpham findById(String id);

	loaisanpham save(loaisanpham entity);

}
