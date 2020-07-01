package lenam.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import lenam.Ass.Entity.hoadon;

@Repository
public  interface  HoaDonRepository extends CrudRepository<hoadon, Integer> {

}
