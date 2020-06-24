package hai.duong.Ass.JapRepository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hai.duong.Ass.Entity.taikhoan;

@Repository
public interface TaiKhoanRepository extends CrudRepository<taikhoan, String>{

	

}
