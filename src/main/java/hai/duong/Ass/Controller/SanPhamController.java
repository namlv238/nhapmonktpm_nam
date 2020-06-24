//package hai.duong.Ass.Controller;
//
//import com.google.gson.JsonArray;
//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import javax.persistence.EntityManagerFactory;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import org.apache.tomcat.util.json.JSONParser;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import org.springframework.beans.factory.annotation.Autowired;
//
//import org.springframework.boot.json.JsonParserFactory;
//
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Controller;
//
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import hai.duong.Ass.Entity.Cart;
//import hai.duong.Ass.Entity.giohang;
//import hai.duong.Ass.Entity.hoadon;
//import hai.duong.Ass.Entity.hoadonchitiet;
//
//import hai.duong.Ass.Entity.sanpham;
//import hai.duong.Ass.Entity.taikhoan;
//import hai.duong.Ass.Services.GioHangServices;
//import hai.duong.Ass.Services.HoaDonChiTietServices;
//import hai.duong.Ass.Services.HoaDonServices;
//import hai.duong.Ass.Services.SanPhamServices;
//import hai.duong.Ass.Services.TaiKhoanServices;
//
//@Controller
//public class SanPhamController {
//	@Autowired
//	private EntityManagerFactory factory;
//	@Autowired
//	private SanPhamServices sanPhamServices;
//	@Autowired
//	private TaiKhoanServices taiKhoanServices;
//	@Autowired
//	private HoaDonServices hoaDonServices;
//	@Autowired
//	private HoaDonChiTietServices hoaDonChiTietServices;
//	@Autowired
//	GioHangServices gioHangServices;
//
//	public Session getCu() {
//		return factory.unwrap(SessionFactory.class).openSession();
//	}
//
//	@GetMapping("dangnhap")
//	public String fromdangnhap1() {
//
//		return "formdangnhap1";
//	}
//
//	@GetMapping("dangxuat")
//	public String dangxuat(HttpSession httpSession, ModelMap model) {
//		try {
//			if (httpSession.getAttribute("giohang") != null) {
//				taikhoan kh = (taikhoan) httpSession.getAttribute("taikhoandn");
//
//				List<Cart> cart = (List<Cart>) httpSession.getAttribute("giohang");
//				JSONArray array = new JSONArray();
//				for (Cart gh : cart) {
//					JSONObject oj = new JSONObject();
//					oj.put("masp", gh.getSp().getMasanpham());
//					oj.put("soluong", Integer.toString(gh.getSoluong()));
//
//					array.put(oj);
//				}
//				gioHangServices.save(new giohang(kh.getTendangnhap(), array.toString()));
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		httpSession.invalidate();
//		return "redirect:/index";
//	}
//
//	@PostMapping(value = "kiemtradangnhap", params = "dn")
//	public String dangnhap(HttpSession httpSession, ModelMap model, @RequestParam("txt_tentk") String tentk,
//			@RequestParam("txt_mk") String mk) {
//
//		if (tentk.isEmpty() && mk.isEmpty()) {
//			model.addAttribute("mes", "Xin moi nhap thong tin");
//		} else {
//			try {
//				taikhoan tk = taiKhoanServices.findById(tentk);
//
//				if (tk.getMatkhau().equals(mk)) {
//					httpSession.setAttribute("taikhoandn", tk);
//					if (tk.getChucnang().equals("admin")) {
//						httpSession.setAttribute("role", true);
//						httpSession.setAttribute("admin", "admin");
//
//					} else {
//						httpSession.setAttribute("role", false);
//					}
//					try {
//
//						giohang dh = gioHangServices.findById(tk.getTendangnhap());
//
//						if (dh != null) {
//							List<Cart> listcart = new ArrayList<Cart>();
//							try {
//
//								JSONArray jsonarray = new JSONArray(dh.getDsgiohang());
//
//								Cart cart = new Cart();
//								for (int i = 0; i < jsonarray.length(); i++) {
//
//									JSONObject jo = jsonarray.getJSONObject(i);
//									String masp = jo.getString("masp");
//
//									String soluong = jo.getString("soluong");
//
//									cart.setSp(sanPhamServices.findById(masp));
//									cart.setSoluong(Integer.parseInt(soluong));
//
//									listcart.add(cart);
//
//								}
//								gioHangServices.deleteById(dh.getId());
//
//							} catch (Exception e) {
//								e.printStackTrace();
//							}
//							httpSession.setAttribute("giohang", listcart);
//						}
//
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//
//					return "redirect:/index";
//
//				} else {
//					model.addAttribute("mes", "Sai mat khau");
//				}
//
//			} catch (Exception e) {
//				model.addAttribute("mes", "Sai ten dang nhap");
//				return "formdangnhap1";
//			}
//
//		}
//
//		return "formdangnhap1";
//	}
//
//	@GetMapping("dangkyKH")
//	public String dangkyKhachHang(ModelMap model) {
//		model.addAttribute("dangkyKH", new taikhoan());
//		return "dangkyKH1";
//	}
//
//	@PostMapping(value = "dangkykh", params = "btn_dangkykh")
//	public String dangkyKH(ModelMap model, @ModelAttribute("dangkyKH") taikhoan tk) {
//		try {
//			tk.setChucnang("kh");
//
//			taiKhoanServices.save(tk);
//
//			model.addAttribute("mes", "dang ky thanh cong");
//		} catch (Exception e) {
//			model.addAttribute("mes", "dang ky that bai kiem tra lai thong tin");
//			e.printStackTrace();
//		}
//
//		return "dangkyKH1";
//	}
//
//	@GetMapping("dstaikhoan")
//
//	public String dsTaiKhoan(ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//
//		List<taikhoan> listTK = taiKhoanServices.findAll();
//		model.addAttribute("listTk", listTK);
//		model.addAttribute("taikhoanNv", new taikhoan());
//		return "dstaikhoan1";
//
//	}
//
//	@GetMapping("themTKNV")
//	public String themTKnv(ModelMap model, HttpSession httpSession) {
//
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		model.addAttribute("taikhoanNv", new taikhoan());
//
//		return "dangkyTkNV1";
//
//	}
//
//	@PostMapping(value = "dangkynv", params = "btn_dangkynv")
//	public String dangkynv(@ModelAttribute("taikhoanNv") taikhoan tk, ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//
//		try {
//			tk.setChucnang("admin");
//
//			taiKhoanServices.save(tk);
//
//			model.addAttribute("mes", "dang ky thanh cong");
//		} catch (Exception e) {
//			model.addAttribute("mes", "dang ky that bai kiem tra lai thong tin");
//			e.printStackTrace();
//		}
//		return "redirect:/dstaikhoan";
//	}
//
//	@GetMapping("fromlaylaimk")
//	public String fromLaylaiMk() {
//
//		return "laylaimk";
//	}
//
//	@Autowired
//	private JavaMailSender javaMailSender;
//
//	@PostMapping(value = "laylaimk", params = "btn_laylaimk")
//	public String layLaimk(ModelMap model, @RequestParam("txt_tendangnhap") String tendangnhap,
//			@RequestParam("txt_email") String email) {
//		try {
//			taikhoan tk = taiKhoanServices.findById(tendangnhap);
//
//			if (tk.getEmail().equals(email)) {
//
//				try {
//
//					SimpleMailMessage msg = new SimpleMailMessage();
//					msg.setTo(email);
//					msg.setSubject("xin chao : " + tendangnhap + "\n Nhan mat khau");
//					msg.setText("mat khau : " + tk.getMatkhau());
//					javaMailSender.send(msg);
//					model.addAttribute("mes", "thanh cong email");
//				} catch (Exception e) {
//					e.printStackTrace();
//					model.addAttribute("mes", "that bai email" + e.getMessage());
//				}
//
//				model.addAttribute("mes", "Thành công   Xin moi kiem tra Email");
//
//			} else {
//				model.addAttribute("mes", "sai Email");
//
//			}
//		} catch (Exception e) {
//			model.addAttribute("mes", "Sai ten dang nhap");
//		}
//
//		return "laylaimk";
//	}
//
//	@GetMapping("fromdoimk")
//	public String fromDoiMk() {
//		return "doimk";
//	}
//
//	@PostMapping(value = "btndoimk", params = "btn_doimk")
//	public String doimk(HttpSession httpSession, ModelMap model, HttpServletRequest request) {
//		String mkcu = request.getParameter("mkcu");
//		String mkmoi = request.getParameter("mkmoi");
//		String mknhaplai = request.getParameter("mknhaplai");
//		taikhoan tk = (taikhoan) httpSession.getAttribute("taikhoandn");
//
//		if (tk.getMatkhau().equals(mkcu)) {
//
//			if (mkmoi.equals(mknhaplai)) {
//				tk.setMatkhau(mkmoi);
//				taiKhoanServices.save(tk);
//				model.addAttribute("mes", "Doi Mat khau thanh cong");
//			} else {
//				model.addAttribute("mes", "Mat khau nhap lai khong khop");
//			}
//
//		} else {
//			model.addAttribute("mes", "Mat khau cu khong dung");
//		}
//
//		return "doimk";
//	}
//
//	@GetMapping("xoaTk/{id}")
//	public String xoaTK(@PathVariable("id") String id, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		taiKhoanServices.deleteById(id);
//		return "redirect:/dstaikhoan";
//	}
//
//	@GetMapping("index")
//	public String index(HttpSession httpSession) {
//		List<sanpham> list = sanPhamServices.findAll();
//		httpSession.setAttribute("listsp", list);
//		return "index1";
//	}
//
//	@GetMapping("btn_themgiohang/{id}")
//	public String themgiohang(HttpSession httpSession, @PathVariable("id") String masp) {
//		sanpham sanpham = sanPhamServices.findById(masp);
//		if (httpSession.getAttribute("giohang") == null) {
//			List<Cart> listcart = new ArrayList<Cart>();
//			listcart.add(new Cart(sanpham, 1));
//			httpSession.setAttribute("giohang", listcart);
//
//		} else {
//			List<Cart> listcart = (List<Cart>) httpSession.getAttribute("giohang");
//
//			int index = Vitri(sanpham.getMasanpham(), listcart);
//
//			if (index == -1) {
//				listcart.add(new Cart(sanpham, 1));
//			} else {
//				int sl = listcart.get(index).getSoluong() + 1;
//				listcart.get(index).setSoluong(sl);
//			}
//			httpSession.setAttribute("giohang", listcart);
//
//		}
//
//		return "index1";
//	}
//
//	@GetMapping("btn_giohang")
//	public String Giohangview() {
//		return "giohang1";
//	}
//
//	@GetMapping("btn_xoagiohang/{id}")
//	public String xoaGiohang(HttpSession httpSession, @PathVariable("id") String id) {
//		List<Cart> listcart = (List<Cart>) httpSession.getAttribute("giohang");
//		int index = Vitri(id, listcart);
//		listcart.remove(index);
//
//		return "index1";
//	}
//
//	@PostMapping(value = "dathang", params = "dathang")
//	public String dathang(ModelMap model, HttpSession httpSession, @RequestParam("hotennguoinhan") String hoten,
//			@RequestParam("diachinhanhang") String diachi, @RequestParam("sdtnhanhang") String sdt) {
//		String ghichu = "Họ tên : " + hoten + "    diachi: " + diachi + "   so dien thoai : " + sdt;
//		List<Cart> listcart = (List<Cart>) httpSession.getAttribute("giohang");
//
//		if (listcart != null) {
//			taikhoan tk = (taikhoan) httpSession.getAttribute("taikhoandn");
//
//			try {
//
//				hoadon hd = new hoadon(new Date(), "Chưa Chuyển", ghichu, tk);
//
//				hoaDonServices.save(hd);
//
//				for (Cart cart : listcart) {
//					hoaDonChiTietServices.save(new hoadonchitiet(hd, cart.getSp(), cart.getSoluong()));
//
//				}
//				model.addAttribute("mes", "Đặt hàng thành công");
//				httpSession.removeAttribute("giohang");
//
//			} catch (Exception e) {
//				model.addAttribute("mes", "Đặt hàng thất bại");
//				e.printStackTrace();
//				System.out.println(e);
//			}
//		}
//
//		return "index1";
//	}
//
//	@GetMapping("dsdathang")
//	public String dsDatHang(ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		Session session = getCu();
//
//		String hqlHoaDon = "from hoadon where trangthai= 'Chưa Chuyển' order by mahoadon desc ";
//		Query queryHD = session.createQuery(hqlHoaDon);
//		List<hoadon> listHD = queryHD.list();
//		model.addAttribute("listhd", listHD);
//		for (hoadon hoadon : listHD) {
//			System.out.println(hoadon.getMahoadon() + "   " + hoadon.getTaikhoans());
//		}
//
////		String hql1 = "from hoadonchitiet join hoadon  where hoadon.mahoadon=hoadonchitiet.mahoadon and  hoadon.trangthai= 'Chưa Chuyển'    group by hoadonchitiet.mahoadonchitiet order by hoadonchitiet.mahoadonchitiet desc";
////		Query query1 = session.createQuery(hql1);
////		List<hoadonchitiet> listhdct = query1.list();
////		System.out.println(listhdct.size());
////		model.addAttribute("listct", listhdct);
//
//		for (hoadon hd : listHD) {
//			String hql = "from hoadonchitiet where mahoadon =" + hd.getMahoadon() + " order by mahoadon desc";
//			Query query = session.createQuery(hql);
//			List<hoadonchitiet> listhdct1 = query.list();
//			model.addAttribute(hd.getMahoadon() + "1", listhdct1);
//		}
//
//		return "dsdathang1";
//
//	}
//
//	@GetMapping("dsdathang1")
//	public String dshoadon(ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		Session session = getCu();
//
//		String hqlHoaDon = "from hoadon  order by mahoadon desc ";
//		Query queryHD = session.createQuery(hqlHoaDon);
//		List<hoadon> listHD = queryHD.list();
//		model.addAttribute("listhd", listHD);
//		for (hoadon hoadon : listHD) {
//			System.out.println(hoadon.getMahoadon() + "   " + hoadon.getTaikhoans());
//		}
//
//		for (hoadon hd : listHD) {
//			String hql = "from hoadonchitiet where mahoadon =" + hd.getMahoadon() + " order by mahoadon desc";
//			Query query = session.createQuery(hql);
//			List<hoadonchitiet> listhdct1 = query.list();
//			model.addAttribute(hd.getMahoadon() + "1", listhdct1);
//		}
//
//		return "danhsachhoadon";
//
//	}
//
//	@GetMapping("chuyenhang/{id}")
//	public String chuyenHang(@PathVariable("id") int mahd, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		try {
//			hoadon hd = hoaDonServices.findById(mahd);
//			hd.setTrangthai("Đã Chuyển");
//			hoaDonServices.save(hd);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return "redirect:/dsdathang";
//	}
//
//	@GetMapping("huychuyenhang/{id}")
//	public String huychuyenhang(@PathVariable("id") int mahd, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//
//		try {
//			hoaDonServices.deleteById(mahd);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/dsdathang";
//	}
//
//	@GetMapping("dshoadonchitiet/{id}")
//	public String dshoadonchitiet(ModelMap model, @PathVariable("id") String mahd, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		Session session = getCu();
//		String hql = "from hoadonchitiet where hoadons.mahoadon = " + mahd;
//		Query query = session.createQuery(hql);
//		List<hoadonchitiet> listhdct = query.list();
//		model.addAttribute("listhdct", listhdct);
//		httpSession.setAttribute("id", mahd);
//		return "dshoadonchitiet";
//	}
//
//	@GetMapping("huydathanghdct/{id}")
//	public String huydathanghdct(@PathVariable("id") int id, HttpSession httpSession, ModelMap model) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//
//		try {
//			hoaDonChiTietServices.deleteById(id);
//
//			int mahd = Integer.parseInt(httpSession.getAttribute("id").toString());
//			Session session = getCu();
//			String hql = "from hoadonchitiet where hoadons.mahoadon = " + mahd;
//			Query query = session.createQuery(hql);
//			List<hoadonchitiet> listhdct = query.list();
//			model.addAttribute("listhdct", listhdct);
//			httpSession.setAttribute("chinhsua", mahd);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/dsdathang";
//	}
//
//	@GetMapping(value = "capnhatsoluong", params = "btn_capnhatsl")
//	public String capnhatsoluong(HttpServletRequest request, @RequestParam("slsp") String sl,
//			@RequestParam("mahdct") String mahdct, HttpSession httpSession, ModelMap model) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		try {
//
//			hoadonchitiet hdct = hoaDonChiTietServices.findById(Integer.parseInt(mahdct));
//			hdct.setSoluong(Integer.parseInt(sl));
//			hoaDonChiTietServices.save(hdct);
//
//			// int mahd = Integer.parseInt(httpSession.getAttribute("id").toString());
//			int mahd = hdct.getHoadons().getMahoadon();
//			httpSession.setAttribute("chinhsua", mahd);
//			Session session = getCu();
//			// String hql = "from hoadonchitiet where hoadons.mahoadon = " + mahd;
////			Query query = session.createQuery(hql);
////			List<hoadonchitiet> listhdct = query.list();
////			model.addAttribute("listhdct", listhdct);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/dsdathang";
//	}
//
//	@GetMapping("indexsp")
//	public String indexsanpham(ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		List<sanpham> list = sanPhamServices.findAll();
//		httpSession.setAttribute("listsp", list);
//		model.addAttribute("sanpham", new sanpham());
//		return "indexsanpham1";
//	}
//
//	@GetMapping("btn_themsp")
//	public String ThemSp(ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		model.addAttribute("sanpham", new sanpham());
//
//		return "indexsanpham1";
//	}
//
//	@GetMapping("btn_xoasp/{id}")
//	public String Xoasp(ModelMap model, @PathVariable("id") String masp, HttpSession httpSession) {
//
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		sanPhamServices.deleteById(masp);
//
//		return "redirect:/indexsp";
//	}
//
//	@GetMapping("btn_capnhatsp/{id}")
//	public String Capnhatsp(@PathVariable("id") String masp, ModelMap model, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		List<sanpham> list = (List<sanpham>) httpSession.getAttribute("listsp");
//		for (sanpham sp : list) {
//			if (sp.getMasanpham().equals(masp)) {
//				model.addAttribute("sanpham", sp);
//			}
//		}
//		return "indexsanpham1";
//	}
//
//	@PostMapping(value = "addorupdateSP", params = "btn_addorupdateSP")
//	public String AddOrUpdateSanpham(ModelMap model, @ModelAttribute("sanpham") sanpham sp,
//			@RequestParam("photo") MultipartFile photo, HttpSession httpSession) {
//		if (httpSession.getAttribute("admin") == null) {
//			httpSession.invalidate();
//			return "formdangnhap1";
//
//		}
//		try {
//			if (photo.getSize() > 0) {
//				sp.setHinhanh(photo.getOriginalFilename());
//			}
//			sanPhamServices.save(sp);
//			model.addAttribute("mes", "thanh cong sp");
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("mes", "loi sp");
//		}
//
//		return "redirect:/indexsp";
//	}
//
//	private int Vitri(String id, List<Cart> cart1) {
//		for (int i = 0; i < cart1.size(); i++) {
//			if (cart1.get(i).getSp().getMasanpham().equals(id)) {
//				return i;
//			}
//		}
//		return -1;
//
//	}
//
//}
