package hai.duong.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hai.duong.Ass.Entity.giohang;

@Repository
public interface GioHangRepository extends CrudRepository<giohang, String> {

}
