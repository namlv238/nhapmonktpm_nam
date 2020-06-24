package hai.duong.Ass.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hai.duong.Ass.Entity.giohang;
import hai.duong.Ass.JapRepository.GioHangRepository;

@Service
public class GioHangServivesIpm implements GioHangServices {
@Autowired
GioHangRepository gioHangRepository;

@Override
public giohang save(giohang entity) {
	return gioHangRepository.save(entity);
}

@Override
public giohang findById(String id) {
	return (giohang) gioHangRepository.findById(id).get();
}

@Override
public List<giohang> findAll() {
	return (List<giohang>) gioHangRepository.findAll();
}

@Override
public void deleteById(String id) {
	gioHangRepository.deleteById(id);
}

}
