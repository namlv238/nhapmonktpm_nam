package lenam.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lenam.Ass.Entity.sanpham;
import lenam.Ass.JapRepository.SanPhamRepository;

@Service
public class SanPhamServicesIpm implements SanPhamServices {
	@Autowired
	SanPhamRepository sanPhamRepository;

	@Override
	public sanpham save(sanpham entity) {
		return sanPhamRepository.save(entity);
	}

	@Override
	public sanpham findById(String id) {
		return (sanpham) sanPhamRepository.findById(id).get();
	}

	@Override
	public List<sanpham> findAll() {
		return (List<sanpham>) sanPhamRepository.findAll();
	}

	@Override
	public void deleteById(String id) {
		sanPhamRepository.deleteById(id);
	}
	

}
