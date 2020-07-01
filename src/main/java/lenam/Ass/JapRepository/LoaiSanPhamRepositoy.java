package lenam.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import lenam.Ass.Entity.loaisanpham;

@Repository
public interface LoaiSanPhamRepositoy extends CrudRepository<loaisanpham, String>{

}
