package lenam.Ass.JapRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import lenam.Ass.Entity.giohang;

@Repository
public interface GioHangRepository extends CrudRepository<giohang, String> {

}
