package hai.duong.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hai.duong.Ass.Entity.hoadonchitiet;
import hai.duong.Ass.JapRepository.HoaDonChiTietRepository;
import hai.duong.Ass.JapRepository.HoaDonRepository;

@Service
public class HoaDonChiTietServicesIpm implements HoaDonChiTietServices{
@Autowired
HoaDonChiTietRepository hoaDonChiTietRepository;

@Override
public hoadonchitiet save(hoadonchitiet entity) {
	return hoaDonChiTietRepository.save(entity);
}

@Override
public hoadonchitiet findById(Integer id) {
	return (hoadonchitiet) hoaDonChiTietRepository.findById(id).get();
}

@Override
public List<hoadonchitiet> findAll() {
	return (List<hoadonchitiet>) hoaDonChiTietRepository.findAll();
}

@Override
public void deleteById(Integer id) {
	hoaDonChiTietRepository.deleteById(id);
}




	
	
}
