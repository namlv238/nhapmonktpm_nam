package lenam.Ass.JapRepository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import lenam.Ass.Entity.taikhoan;

@Repository
public interface TaiKhoanRepository extends CrudRepository<taikhoan, String>{

	

}
