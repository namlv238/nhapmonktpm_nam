package hai.duong.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hai.duong.Ass.Entity.hoadon;

@Repository
public  interface  HoaDonRepository extends CrudRepository<hoadon, Integer> {

}
