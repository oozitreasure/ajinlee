package com.health.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.DTO.freeDTO;
import com.health.DTO.mainDTO;
import com.health.DTO.parkDTO;
import com.health.service.IMainService;
import com.health.util.CmmUtil;
import com.health.util.TextUtil;
	
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "MainService")
	private IMainService mainService;
	

	@RequestMapping(value="home", method=RequestMethod.GET)
	public String home(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   userList start!!!");
		
		List<freeDTO> fList = mainService.getFreeList();
		
		if (fList == null) {
			
			fList = new ArrayList<>();
		}
		
		model.addAttribute("fList", fList);
		
		log.info(this.getClass() + "   userList end!!!");
		
		return "home";
		
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "register";
		
	}
	
	@RequestMapping(value = "/free_detail")
	public String free_detail(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   free_detail start!!!");
		
		String fr_no = CmmUtil.nvl(re.getParameter("fr_no"));
		
		log.info("fr_no : " + fr_no);
		
		freeDTO rDTO = mainService.getFree(fr_no);
		
		if (rDTO == null) {
			rDTO = new freeDTO();
		}
		model.addAttribute("rDTO", rDTO);
		
		log.info(this.getClass() + "   free_detail end!!!");
		
		return "/free_detail";
	}
	   
	   
	
	@RequestMapping(value="free_insert", method=RequestMethod.GET)
	public String free_insert(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "free_insert";
		
		
		
	}
	
	@RequestMapping(value="free_E", method=RequestMethod.GET)
	public String free_E(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "free_E";
		
		
		
	}
	
	@RequestMapping(value="PWDschange", method=RequestMethod.GET)
	public String PWDschange(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "PWDschange";
		
		
		
	}
	
	
	@RequestMapping(value = "/park_E")
	public String park_E(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   park_E start!!!");
		
		String admin_no = CmmUtil.nvl(re.getParameter("admin_no"));
		
		log.info("admin_no : " + admin_no);
		
		parkDTO aDTO = mainService.getPark(admin_no);
		
		if (aDTO == null) {
			aDTO = new parkDTO();
		}
		model.addAttribute("aDTO", aDTO);
		
		log.info(this.getClass() + "   park_E end!!!");
		
		return "/park_E";
	}
	
	
	@RequestMapping(value = "/free_insert_proc")
	   public String free_insert_proc(HttpSession session, HttpServletRequest re, HttpServletResponse response,
	         ModelMap model) throws Exception {

	      log.info(this.getClass() + "   free_insert_proc start!!");

	      String user_name = CmmUtil.nvl((String) session.getAttribute("session_user_name"));
	      String reg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	      String titled = CmmUtil.nvl((String) re.getParameter("title"));
	      String title = TextUtil.exchangeEscapeNvl(titled);
/*	      String notice_check = CmmUtil.nvl((String) re.getParameter("notice_check"));*/
	      String contentd = CmmUtil.nvl((String) re.getParameter("content"));
	      String content = TextUtil.exchangeEscapeNvl(contentd);
	      String user_id = CmmUtil.nvl((String) session.getAttribute("session_user_id"));

	      log.info("user_name: " + user_name);
	      log.info("reg_no: " + reg_no);
	      log.info("title : " + title);
/*	      log.info("notice_check: " + notice_check);*/
	      log.info("content: " + content);
	      log.info("user_id: " + user_id);

	      freeDTO fDTO = new freeDTO();

	      fDTO.setUser_name(user_name);
	      fDTO.setReg_no(reg_no);
	      fDTO.setTitle(title);
/*	      fDTO.setNotice_check(notice_check);*/
	      fDTO.setContent(content);
	      fDTO.setUser_id(user_id);

	      int req = mainService.free_insert_proc(fDTO);
	      
	      if (req != 0) {
	         model.addAttribute("msg", "등록되었습니다.");
	         model.addAttribute("url", "/freeList.do");
	      } else {
	         model.addAttribute("msg", "실패하였습니다.");
	         model.addAttribute("url", "/free_insert.do");
	      }
	      
	      log.info(this.getClass() + "   free_insert_proc end!!");
	      
	      return "/alert";
	   }
	
	
	@RequestMapping(value = "/park_insert_proc")
	   public String park_insert_proc(HttpSession session, HttpServletRequest re, HttpServletResponse response,
	         ModelMap model) throws Exception {

	      log.info(this.getClass() + "   park_insert_proc start!!");

	      String admin_no = CmmUtil.nvl((String) re.getParameter("admin_no"));
	      String park_name = CmmUtil.nvl((String) re.getParameter("park_name"));
	      String park_div = CmmUtil.nvl((String) re.getParameter("park_div"));
	      String addr1 = CmmUtil.nvl((String) re.getParameter("addr1"));
	      String park_est1 = CmmUtil.nvl((String) re.getParameter("park_est1"));
	      String park_est2 = CmmUtil.nvl((String) re.getParameter("park_est2"));
	      String park_est3 = CmmUtil.nvl((String) re.getParameter("park_est3"));
	      String park_est4 = CmmUtil.nvl((String) re.getParameter("park_est4"));
	      String park_est5 = CmmUtil.nvl((String) re.getParameter("park_est5"));
	      String admin_name = CmmUtil.nvl((String) re.getParameter("admin_name"));
	      String number = CmmUtil.nvl((String) re.getParameter("number"));
	      
	      log.info("admin_no: " + admin_no);
	      log.info("park_name: " + park_name);
	      log.info("park_div : " + park_div);
	      log.info("addr1: " + addr1);
	      log.info("park_est1: " + park_est1);
	      log.info("park_est2: " + park_est2);
	      log.info("park_est3: " + park_est3);
	      log.info("park_est4: " + park_est4);
	      log.info("park_est5: " + park_est5);
	      log.info("admin_name: " + admin_name);
	      log.info("number: " + number);

	      parkDTO pDTO = new parkDTO();

	      pDTO.setAdmin_no(admin_no);
	      pDTO.setPark_name(park_name);
	      pDTO.setPark_div(park_div);
	      pDTO.setAddr1(addr1);
	      pDTO.setPark_est1(park_est1);
	      pDTO.setPark_est2(park_est2);
	      pDTO.setPark_est3(park_est3);
	      pDTO.setPark_est4(park_est4);
	      pDTO.setPark_est5(park_est5);
	      pDTO.setAdmin_name(admin_name);
	      pDTO.setNumber(number);

	      String req = mainService.park_insert_proc(pDTO);
	      
	      if (req != null) {
	         model.addAttribute("msg", "등록되었습니다.");
	         model.addAttribute("url", "/freeList.do");
	      } else {
	         model.addAttribute("msg", "실패하였습니다.");
	         model.addAttribute("url", "/free_insert.do");
	      }
	      
	      log.info(this.getClass() + "   park_insert_proc end!!");
	      
	      return "/alert";
	   }
	
	
	@RequestMapping(value = "/park_detail")
	public String park_detail(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   park_detail start!!!");
		
		String admin_no = CmmUtil.nvl(re.getParameter("admin_no"));
		
		log.info("admin_no : " + admin_no);
		
		parkDTO aDTO = mainService.getPark(admin_no);
		
		if (aDTO == null) {
			aDTO = new parkDTO();
		}
		model.addAttribute("aDTO", aDTO);
		
		log.info(this.getClass() + "   park_detail end!!!");
		
		return "/park_detail";
	}
	
	
	@RequestMapping(value="park_insert", method=RequestMethod.GET)
	public String park_insert(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "park_insert";
		
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpServletRequest re, HttpServletResponse response, 
			ModelMap model, HttpSession session) throws Exception {		
		
		log.info(getClass() + "    join start!!!");
		
		String user_id = CmmUtil.nvl(re.getParameter("user_id"));
		String user_name = CmmUtil.nvl(re.getParameter("user_name"));
		String email = CmmUtil.nvl(re.getParameter("email"));
		String password = CmmUtil.nvl(re.getParameter("password"));
		String addr = CmmUtil.nvl(re.getParameter("addr"));
		
		log.info("user_id : " + user_id);
		log.info("addr : " + addr);
		log.info("password : " + password);
		log.info("email : " + email);
		log.info("user_name : " + user_name);
		
		mainDTO mDTO = new mainDTO();
		
		mDTO.setUser_id(user_id);
		mDTO.setUser_name(user_name);
		mDTO.setEmail(email);
		mDTO.setPassword(password);
		mDTO.setAddr(addr);
		
		int r = mainService.insertJoin(mDTO);
		
		if(r != 0) {
			
			model.addAttribute("msg", "회원가입에 성공하였습니다.");
			model.addAttribute("url", "home.do");
			
		}else {
			
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			model.addAttribute("url", "register.do");
		}
		
		
		log.info(getClass() + "     join end!!!");
		
		return "alert";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "login";
		
	}
	
	@RequestMapping(value="IDs", method=RequestMethod.GET)
	public String IDs(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "IDs";
		
	}
	@RequestMapping(value="PWDs", method=RequestMethod.GET)
	public String PWDs(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		
		return "PWDs";
		
	}
	
	@RequestMapping(value="mylike", method=RequestMethod.GET)
	public String mylike(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		
		return "mylike";
		
	}
	

	
	@RequestMapping(value="board2", method=RequestMethod.GET)
	public String board2(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "board2";
		
	}
	
	@RequestMapping(value="park_1", method=RequestMethod.GET)
	public String park_1(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "park_1";
		
	}
	
	@RequestMapping(value = "/user_detail")
	public String mypage2(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   user_detail start!!!");
		
		String user_no = re.getParameter("user_no");
		
		log.info("user_no : " + user_no);
		
		mainDTO gDTO = mainService.getUserInfoOne(user_no);
		
		if (gDTO == null) {
			gDTO = new mainDTO();
		}
		model.addAttribute("gDTO", gDTO);
		
		log.info(this.getClass() + "   user_detail end!!!");
		
		return "/user_detail";
	}


	@RequestMapping(value = "/login_proc")
	public String login_proc(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "login_proc start!!!");

		String user_id = re.getParameter("user_id");
		String password =/* SHA256.SHA256_encode(*/re.getParameter("password");

		log.info(getClass() + "user_id : " + user_id);
		log.info(getClass() + "password : " + password);

		mainDTO gDTO = new mainDTO();
		
		gDTO.setUser_id(user_id);
		gDTO.setPassword(password);

		gDTO = mainService.getUserInfo(gDTO);

		String returnURL = "";
		
		if (gDTO != null) {
			session.setAttribute("session_user_no", gDTO.getUser_no());
			session.setAttribute("session_user_id", gDTO.getUser_id());
			session.setAttribute("session_user_name", gDTO.getUser_name());
			returnURL = "/close";
			
		} else {
			
			model.addAttribute("msg", "일치하는 회원이 없습니다. 다시 확인해주세요");
			model.addAttribute("url", "login.do");
			returnURL = "/alert";
		}
		user_id = null;
		password = null;
		gDTO = null;
		
		log.info(this.getClass() + "login_proc end!!!");
		
		return returnURL;
	}
	
	@RequestMapping(value = "/logout_proc")
	public String logout_proc(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "logout_proc start!!!");
		
		session.setAttribute("session_user_no", "");
		session.setAttribute("session_user_id", "");
		session.setAttribute("session_user_name", "");
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("url", "/home.do");
		
		log.info(this.getClass() + "logout_proc end!!!");
		
		return "/alert";
	}
	
	@RequestMapping(value = "IDs")
	public String IDs(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		return "IDs";
	}
	
	
	@RequestMapping(value = "/idsearch_proc")
	public String idsearch_proc(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   idsearch_proc start!!!");

		String user_name = re.getParameter("user_name");
		String email = re.getParameter("email");

		log.info(this.getClass() + "user_name : " + user_name);
		log.info(this.getClass() + "email : " + email);

		mainDTO uDTO = new mainDTO();

		uDTO.setUser_name(user_name);
		uDTO.setEmail(email);

		uDTO = mainService.getUserid(uDTO);

		if (uDTO != null) {
			model.addAttribute("msg", "회원님의 아이디는 [ " + uDTO.getUser_id() + " ]입니다.");
			model.addAttribute("url", "/login.do");
		} else {
			model.addAttribute("msg", "일치하는 회원이 없습니다. 다시 확인해주세요");
			model.addAttribute("url", "IDs.do");
		}
		log.info(this.getClass() + "   idsearch_proc end!!!");
		
		uDTO = null;
		
		return "/alert";
	}
	
	
	@RequestMapping(value = "/password_proc")
	public String password_proc(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   pw_search_proc start!!!");

		String user_name = re.getParameter("user_name");
		String user_id = re.getParameter("user_id");
		String email = re.getParameter("email");

		log.info(this.getClass() + "user_name : " + user_name);
		log.info(this.getClass() + "user_id : " + user_id);
		log.info(this.getClass() + "email :" + email);

		mainDTO kDTO = new mainDTO();

		kDTO.setUser_name(user_name);
		kDTO.setUser_id(user_id);
		kDTO.setEmail(email);

		kDTO = mainService.getPassword(kDTO);

		if (kDTO != null) {
			model.addAttribute("msg", "비밀번호변경페이지로 이동합니다.");
			model.addAttribute("url", "PWDschange.do");
			session.setAttribute("session_user_no", kDTO.getUser_no());
		} else {
			model.addAttribute("msg", "일치하는 회원이 없습니다. 다시 확인해주세요");
			model.addAttribute("url", "PWDs.do");
		}
		kDTO = null;
		
		log.info(this.getClass() + "   pw_search_proc end!!!");
		
		return "/alert";
	}
	
	
	@RequestMapping(value = "/password_update.do")
	public String password_update(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   pw_update start!!!");
		
		String user_no = req.getParameter("user_no");
		String password = CmmUtil.nvl/*(SHA256.SHA256_encode*/(req.getParameter("password"));

		log.info("user_no : " + user_no);
		log.info("password : " + password);

		mainDTO uDTO = new mainDTO();

		uDTO.setUser_no(user_no);
		uDTO.setPassword(password);

		int result = mainService.updatePassword(uDTO);

		if (result != 0) {
			
			model.addAttribute("msg", "비밀번호가 변경되었습니다.");
			model.addAttribute("url", "/Login.do");
			session.setAttribute("session_user_no", "");
			
		} else {
			
			model.addAttribute("msg", "비밀번호변경에 실패하였습니다.");
			model.addAttribute("url", "/user_info/pw_change.do");
		}
		
		log.info(this.getClass() + "  pw_update end!!!");
		
		return "/alert";
	}
	
	
	
	
	@RequestMapping(value = "/mypage")
	public String user_detail(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   user_detail start!!!");
		
		String user_no = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
		
		log.info("user_no : " + user_no);
		
		mainDTO gDTO = mainService.getUserInfoOne(user_no);
		
		if (gDTO == null) {
			gDTO = new mainDTO();
		}
		model.addAttribute("gDTO", gDTO);
		
		log.info(this.getClass() + "   user_detail end!!!");
		
		return "/mypage";
	}
	
	
	@RequestMapping(value = "/user_update")
	public String user_update(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   user_update start!!!");
		
		String user_no = CmmUtil.nvl(re.getParameter("user_no"));
		String email = CmmUtil.nvl(re.getParameter("email"));
		String addr = CmmUtil.nvl(re.getParameter("addr"));
		
		String chg_no = (String)session.getAttribute("session_user_no");
		

		log.info("email :" + email);
		log.info("addr : " + addr);
		log.info("chg_no : " + chg_no);
		log.info("user_no : " + user_no);

		mainDTO pDTO = new mainDTO();

		pDTO.setUser_no(user_no);
		pDTO.setEmail(email);
		pDTO.setAddr(addr);
		pDTO.setChg_no(chg_no);

		int result = mainService.updateUserInfo(pDTO);

		if (result != 0) {
			model.addAttribute("msg", "회원 정보가 수정되었습니다.");
			model.addAttribute("url", "/mypage.do?user_no=" + user_no);
	
			
		} else {
			
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.");
			model.addAttribute("url", "/mypage.do?user_no=" + user_no);
		}
		
		log.info(this.getClass() + "   user_update end!!!");
		
		return "/alert";
	}
	
	
	

	@RequestMapping(value = "/user_delete")
	public String user_delete(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   user_delete start!!!");
		
		/*String user_no = CmmUtil.nvl(re.getParameter("user_no"));*/
		String user_no = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
		
		log.info("user_no : " + user_no);
		
		mainDTO dDTO = new mainDTO();
		
		dDTO.setUser_no(user_no);
		
		log.info("user_no : " + user_no);

		int result = mainService.deleteUserInfo(dDTO);
		
		if (result != 0) {
			session.setAttribute("session_user_no", "");
			session.setAttribute("session_user_id", "");
			session.setAttribute("session_user_name", "");
			model.addAttribute("msg", "회원이 탈퇴되었습니다.");
			model.addAttribute("url", "/home.do");
			
		} else {
			
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			model.addAttribute("url", "/mypage.do?user_no=" + user_no);
		}
		
		log.info(this.getClass() + "   user_delete end!!!");
		
		return "/alert";
	}
	
	@RequestMapping(value = "/userList")
	
	public String userList(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   userList start!!!");
		
		List<mainDTO> uList = mainService.getUserList();
		
		if (uList == null) {
			
			uList = new ArrayList<>();
		}
		
		model.addAttribute("uList", uList);
		
		log.info(this.getClass() + "   userList end!!!");
		
		return "/userList";
	}
	
	
	@RequestMapping(value = "/park")
	
	public String park(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   getParkList start!!!");
		
		List<parkDTO> pList = mainService.getParkList();
		
		if (pList == null) {
			
			pList = new ArrayList<>();
		}
		
		model.addAttribute("pList", pList);
		
		log.info(this.getClass() + "   getParkList end!!!");
		
		return "/park";
	}
	
	
	@RequestMapping(value = "/freeList")
	
	public String freeList(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   userList start!!!");
		
		List<freeDTO> fList = mainService.getFreeList();
		
		if (fList == null) {
			
			fList = new ArrayList<>();
		}
		
		model.addAttribute("fList", fList);
		
		log.info(this.getClass() + "   userList end!!!");
		
		return "/freeList";
	}

	

	}