package hai.duong.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hai.duong.Ass.Entity.taikhoan;
import hai.duong.Ass.JapRepository.TaiKhoanRepository;

@Service
public class TaiKhoanServicesIpm implements TaiKhoanServices{
@Autowired
TaiKhoanRepository taiKhoanRepository;

@Override
public taikhoan save(taikhoan entity) {
	return taiKhoanRepository.save(entity);
}

@Override
public taikhoan findById(String id) {
	return (taikhoan) taiKhoanRepository.findById(id).get();
}

@Override
public List<taikhoan> findAll() {
	return (List<taikhoan>) taiKhoanRepository.findAll();
}

@Override
public void deleteById(String id) {
	taiKhoanRepository.deleteById(id);
}

}
