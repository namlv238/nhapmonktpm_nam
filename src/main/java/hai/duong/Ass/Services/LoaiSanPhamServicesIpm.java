package hai.duong.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hai.duong.Ass.Entity.loaisanpham;
import hai.duong.Ass.JapRepository.LoaiSanPhamRepositoy;

@Service
public class LoaiSanPhamServicesIpm implements LoaiSanPhamServices {
@Autowired
LoaiSanPhamRepositoy loaiSanPhamRepositoy;

@Override
public loaisanpham save(loaisanpham entity) {
	return loaiSanPhamRepositoy.save(entity);
}

@Override
public loaisanpham findById(String id) {
	return (loaisanpham) loaiSanPhamRepositoy.findById(id).get();
}

@Override
public List<loaisanpham> findAll() {
	return (List<loaisanpham>) loaiSanPhamRepositoy.findAll();
}

@Override
public void deleteById(String id) {
	loaiSanPhamRepositoy.deleteById(id);
}


}
