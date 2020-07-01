package lenam.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lenam.Ass.Entity.hoadon;
import lenam.Ass.JapRepository.HoaDonRepository;

@Service
public class HoaDonServicesIpm implements HoaDonServices{
@Autowired

HoaDonRepository hoaDonRepository;

@Override
public hoadon save(hoadon entity) {
	return hoaDonRepository.save(entity);
}

@Override
public hoadon findById(Integer id) {
	return (hoadon) hoaDonRepository.findById(id).get();
}

@Override
public List<hoadon> findAll() {
	return (List<hoadon>) hoaDonRepository.findAll();
}

@Override
public void deleteById(Integer id) {
	hoaDonRepository.deleteById(id);
}

}
