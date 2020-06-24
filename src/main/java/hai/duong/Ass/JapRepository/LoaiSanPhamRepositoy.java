package hai.duong.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hai.duong.Ass.Entity.loaisanpham;

@Repository
public interface LoaiSanPhamRepositoy extends CrudRepository<loaisanpham, String>{

}
