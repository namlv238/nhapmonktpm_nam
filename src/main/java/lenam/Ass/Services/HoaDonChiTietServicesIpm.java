package lenam.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lenam.Ass.Entity.hoadonchitiet;
import lenam.Ass.JapRepository.HoaDonChiTietRepository;
import lenam.Ass.JapRepository.HoaDonRepository;

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
