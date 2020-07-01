package lenam.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import lenam.Ass.Entity.sanpham;

@Repository
public interface SanPhamRepository extends CrudRepository<sanpham, String>{

}
