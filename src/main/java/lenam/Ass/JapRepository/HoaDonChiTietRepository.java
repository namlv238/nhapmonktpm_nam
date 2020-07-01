package lenam.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import lenam.Ass.Entity.hoadonchitiet;

@Repository
public interface HoaDonChiTietRepository extends CrudRepository<hoadonchitiet, Integer> {

}
