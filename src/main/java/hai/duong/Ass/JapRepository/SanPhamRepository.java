package hai.duong.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hai.duong.Ass.Entity.sanpham;

@Repository
public interface SanPhamRepository extends CrudRepository<sanpham, String>{

}
