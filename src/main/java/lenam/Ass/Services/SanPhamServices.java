package lenam.Ass.Services;

import java.util.List;

import lenam.Ass.Entity.sanpham;

public interface SanPhamServices {

	void deleteById(String id);

	List<sanpham> findAll();

	sanpham findById(String id);

	sanpham save(sanpham entity);

}
