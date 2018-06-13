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

import com.health.DTO.HoDTO;
import com.health.DTO.fiDTO;
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
	
	@RequestMapping(value="/like", method=RequestMethod.POST)
	public String like(HttpServletRequest request, HttpServletResponse response, HttpSession session,
					ModelMap model) throws Exception {

		   
		  log.info(this.getClass().getName() + "favorite list start!");
		  
		  String admin_no = CmmUtil.nvl(request.getParameter("admin_no"));
		  String user_no =  CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  HoDTO hDTO = new HoDTO();
		  hDTO.setAdmin_no(admin_no);
		  hDTO.setUser_no(user_no);
		  log.info("admin_no : " + admin_no);
		  log.info("user_no : " + user_no);
		  HoDTO favorites = mainService.favoriteSelectList(hDTO);

		  log.info("List:" + favorites);
		  
		  log.info(this.getClass().getName() + "favorite list end!");

		
		
		return "/like";
		
	}
	
	
	@RequestMapping(value = "/parkList2")
	
	public String parkList2(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   getParkList start!!!");
		
		List<parkDTO> pList = mainService.getParkList();
		
		if (pList == null) {
			
			pList = new ArrayList<>();
		}
		
		model.addAttribute("pList", pList);
		
		log.info(this.getClass() + "   getParkList end!!!");
		
		return "/parkList2";
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
	
	@RequestMapping(value = "free_E")
	
	public String free_E(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
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
		
		return "free_E";
	}
			
			
	
	@RequestMapping(value="PWDschange", method=RequestMethod.GET)
	public String PWDschange(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "PWDschange";
		
		
		
	}
	
	
	@RequestMapping(value="close3.do", method=RequestMethod.GET)
	public String close3(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "close3.do";
		
		
		
	}
	
	
	@RequestMapping(value = "park_E")
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
		
		return "park_E";
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
	
	

	
	
	@RequestMapping(value = "/park_detail")
	public String park_detail(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   park_detail start!!!");
		
		String admin_no = CmmUtil.nvl(re.getParameter("admin_no"));
		String user_no = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
		
		log.info("admin_no : " + admin_no);
		
		parkDTO aDTO = mainService.getPark(admin_no);
		
		if (aDTO == null) {
			aDTO = new parkDTO();
		}
		HoDTO hDTO = new HoDTO();
		hDTO.setAdmin_no(admin_no);
		hDTO.setUser_no(user_no);
		hDTO = mainService.favoriteSelectList(hDTO);
		
		model.addAttribute("aDTO", aDTO);
		model.addAttribute("hDTO", hDTO);
		
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
			model.addAttribute("url", "/home.do");
			
			return "/close";
			
		}else {
			
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			model.addAttribute("url", "register.do");
			
			log.info(getClass() + "     join end!!!");
			
			return "/alert";
		}
		

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
	

	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		
		return "main";
		
	}
	
	@RequestMapping(value="top", method=RequestMethod.GET)
	public String top(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		
		return "top";
		
	}
	

	
	@RequestMapping(value="board2", method=RequestMethod.GET)
	public String board2(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "board2";
		
	}
	
	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map(HttpServletRequest re, HttpServletResponse response, 
					ModelMap model) throws Exception {
		
		
		return "map";
		
	}
	

	@RequestMapping(value = "/user_detail")
	public String user_datail(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
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
			returnURL = "/close2";
			
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
		re.setCharacterEncoding("UTF-8");

		
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
	
	
	@RequestMapping(value = "/password_update")
	public String password_update(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   pw_update start!!!");
		
		
		String user_no = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
		
		String password = CmmUtil.nvl(/*(SHA256.SHA256_encode(*/re.getParameter("password"));

		log.info("user_no : " + user_no);
		log.info("password : " + password);

		mainDTO uDTO = new mainDTO();

		uDTO.setUser_no(user_no);
		uDTO.setPassword(password);

		int result = mainService.updatePassword(uDTO);

		if (result != 0) {
			
			model.addAttribute("msg", "비밀번호가 변경되었습니다.");
			model.addAttribute("url", "/login.do");
			session.setAttribute("session_user_no", "");
			
		} else {
			
			model.addAttribute("msg", "비밀번호변경에 실패하였습니다.");
			model.addAttribute("url", "/PWDschange.do");
		}
		
		log.info(this.getClass() + "  pw_update end!!!");
		
		return "/alert";
	}
	
	
	
	
	@RequestMapping(value = "/mypage")
	
	public String mypage(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   mypage start!!!");
		
		String user_no = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
		
		log.info("user_no : " + user_no);
		
		mainDTO gDTO = mainService.getUserInfoOne(user_no);
		
		if (gDTO == null) {
			gDTO = new mainDTO();
		}
		
		List<HoDTO> hList = mainService.getFavoriteList(user_no);
		
		model.addAttribute("gDTO", gDTO);
		model.addAttribute("hList", hList);
		
		log.info(this.getClass() + "   mypage end!!!");
			

		return "/mypage";
	}
	
	
	@RequestMapping(value = "/user_update")
	public String user_update(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   user_update start!!!");
		
		/*String user_no = CmmUtil.nvl(re.getParameter("user_no"));*/
		/*String email = CmmUtil.nvl(re.getParameter("email"));
		String addr = CmmUtil.nvl(re.getParameter("addr"));
				String addr = (String)session.getAttribute("session_addr");*/
		
		
		String user_no = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
		String addr = CmmUtil.nvl(re.getParameter("addr"));
		String email = CmmUtil.nvl(re.getParameter("email"));
		String chg_no = CmmUtil.nvl(re.getParameter("chg_no"));
	

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
			model.addAttribute("url", "/user_detail.do?user_no=" + user_no);
		}
		
		log.info(this.getClass() + "   user_delete end!!!");
		
		return "/alert";
	}
	
	
	@RequestMapping(value = "/delete_user")
	public String delete_user(HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {
		
		log.info(this.getClass() + "   delete_user start!!!");

		String user_no = CmmUtil.nvl(req.getParameter("user_no"));
		
		log.info("user_no : " + user_no);
		
		mainDTO uDTO = new mainDTO();

		uDTO.setUser_no(user_no);

		/*mainService.deleteUserInfo(uDTO);*/
		
		int result = mainService.deleteUserInfo(uDTO);
		
		if (result != 0) {

			model.addAttribute("msg", "회원이 탈퇴되었습니다.");
			model.addAttribute("url", "/userList.do");
			
		} else {
			
			model.addAttribute("msg", "회원탈퇴에 실패하였습니다.");
			model.addAttribute("url", "/user_detail.do?user_no=" + user_no);
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
	
	
	@RequestMapping(value = "/parkList")
	
	public String parkList(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   getParkList start!!!");
		
		List<parkDTO> pList = mainService.getParkList();
		
		if (pList == null) {
			
			pList = new ArrayList<>();
		}
		
		model.addAttribute("pList", pList);
		
		log.info(this.getClass() + "   getParkList end!!!");
		
		return "/parkList";
	}
	

	
	
	
	   @RequestMapping(value = "/freeUpdate")
	   public String FreeUpdate(@RequestParam String fr_no, HttpSession session, HttpServletRequest request, HttpServletResponse response,
	         ModelMap model) throws Exception {

	      log.info(this.getClass().getName() + "   FreeUpdate start!");

	      String msg = "";
	      String url = "";
 
	      try {
	    	  
	         String user_id = CmmUtil.nvl((String) session.getAttribute("session_user_id")); // 아이디
	         String user_name = CmmUtil.nvl((String) session.getAttribute("session_user_name"));
	         String chg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	         String titled = CmmUtil.nvl((String) request.getParameter("title"));
	         String title = TextUtil.exchangeEscapeNvl(titled);
				String contentd = CmmUtil.nvl((String) request.getParameter("content"));
				String content = TextUtil.exchangeEscapeNvl(contentd);
				content = content.replace("\r\n", "<br>");
				
	         log.info("user_id : " + user_id);
	         log.info("user_name : " + user_name);
	         log.info("fr_no : " + fr_no);
	         log.info("title : " + title);
	         log.info("content : " + content);
	         log.info("user_no : " + chg_no);

	         freeDTO rDTO = new freeDTO();

	         rDTO.setUser_id(user_id);
	         rDTO.setUser_name(user_name);
	         rDTO.setFr_no(fr_no);
	         rDTO.setTitle(title);
	         rDTO.setContent(content);
	         rDTO.setChg_no(chg_no);

	         mainService.updateFree(rDTO);
	         
	         msg = "수정되었습니다.";

	         url = "/free_detail.do?fr_no=" + fr_no;

	         rDTO = null;

	      } catch (Exception e) {

	         msg = "실패하였습니다. : " + e.toString();
	         url = "/free_E.do?fr_no=" + fr_no;

	         log.info(e.toString());
	         e.printStackTrace();

	      } finally {
	         log.info(this.getClass().getName() + "   FreeUpdate end!");

	         // 결과 메시지 전달하기
	         model.addAttribute("msg", msg);
	         model.addAttribute("url", url);

	      }
	      // return "/alert";
	      return "/alert";
	   }
	   
		@RequestMapping(value="/parkSearch")
		public @ResponseBody List<parkDTO> parkSearch(@RequestParam(value = "search") String search)throws Exception{
			
			log.info(this.getClass().getName() + "   ParkSearch start!!!");
			
			parkDTO pDTO = new parkDTO();
			
			pDTO.setSearch("%"+search+"%");
			
			log.info("search : " + search);
			
			List<parkDTO> plist = mainService.getparkSearch(pDTO);
			
			log.info(this.getClass().getName() + "   ParkSearch end!!!");
			
			return plist;
		}
		
		@RequestMapping(value="/freeSearch")
		public @ResponseBody List<freeDTO> freeSearch(@RequestParam(value = "search") String search) throws Exception{
			
			log.info(this.getClass().getName() + "   ParkSearch start!!!");
						
			freeDTO fDTO = new freeDTO();
			
			fDTO.setSearch("%"+search+"%");
			
			log.info("search : " + search);
			
			List<freeDTO> flist = mainService.getfreeSearch(fDTO);
			
			log.info(this.getClass().getName() + "   ParkSearch end!!!");
			
			return flist;
		}
		
		
		@RequestMapping(value="/userSearch")
		public @ResponseBody List<mainDTO> userSearch(@RequestParam(value = "search") String search) throws Exception{
			
			log.info(this.getClass().getName() + "   UserSearch start!!!");
						
			mainDTO uDTO = new mainDTO();
			
			uDTO.setSearch("%"+search+"%");
			
			log.info("search : " + search);
			
			List<mainDTO> ulist = mainService.getuserSearch(uDTO);
			
			log.info(this.getClass().getName() + "   UserSearch end!!!");
			
			return ulist;
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



		
		@RequestMapping(value = "/park_insert_proc")
		   public String park_insert_proc(HttpSession session, HttpServletRequest re, HttpServletResponse response,
		         ModelMap model) throws Exception {

		      log.info(this.getClass() + "   park_insert_proc start!!");

		      String admin_no = CmmUtil.nvl((String) re.getParameter("admin_no"));
		      String park_name = CmmUtil.nvl((String) re.getParameter("park_name"));
		      String park_div = CmmUtil.nvl((String) re.getParameter("park_div"));
		      String addr1 = CmmUtil.nvl((String) re.getParameter("addr1"));
		      String addr2 = CmmUtil.nvl((String) re.getParameter("addr2"));
		      String lat = CmmUtil.nvl((String) re.getParameter("lat"));
		      String har = CmmUtil.nvl((String) re.getParameter("har"));
		      String park_area = CmmUtil.nvl((String) re.getParameter("park_area"));
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
		      log.info("addr2: " + addr2);
		      log.info("lat: " + lat);
		      log.info("har: " + har);
		      log.info("park_area: " + park_area);
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
		      pDTO.setAddr2(addr2);
		      pDTO.setLat(lat);
		      pDTO.setHar(har);
		      pDTO.setPark_area(park_area);
		      pDTO.setPark_est1(park_est1);
		      pDTO.setPark_est2(park_est2);
		      pDTO.setPark_est3(park_est3);
		      pDTO.setPark_est4(park_est4);
		      pDTO.setPark_est5(park_est5);
		      pDTO.setAdmin_name(admin_name);
		      pDTO.setNumber(number);

		      int req = mainService.park_insert_proc(pDTO);
		      
		      if (req != 0) {
		         model.addAttribute("msg", "등록되었습니다.");
		         model.addAttribute("url", "/parkList.do");
		      } else {
		         model.addAttribute("msg", "실패하였습니다.");
		         model.addAttribute("url", "/park_insert.do");
		      }
		      
		      log.info(this.getClass() + "   park_insert_proc end!!");
		      
		      return "/alert";
		   }
		
		
		@RequestMapping(value = "/parkUpdate")
		   public String parkUpdate(@RequestParam String admin_no, HttpSession session, HttpServletRequest request, HttpServletResponse response,
		         ModelMap model) throws Exception {

		      log.info(this.getClass().getName() + "   parkUpdate start!");

		      String msg = "";
		      String url = "";

		      try {

		         String park_name = CmmUtil.nvl(request.getParameter("park_name"));
		         String park_div = CmmUtil.nvl(request.getParameter("park_div"));
		         
		         
		         String addr = CmmUtil.nvl((String)request.getParameter("addr1"));
		         String addr1 = TextUtil.exchangeEscapeNvl(addr);	

		         
		         
		         
		         String addr2 = CmmUtil.nvl(request.getParameter("addr2"));
		         String lat = CmmUtil.nvl(request.getParameter("lat"));
		         String har = CmmUtil.nvl(request.getParameter("har"));
		         String park_area = CmmUtil.nvl(request.getParameter("park_area"));
		         String park_est1 = CmmUtil.nvl(request.getParameter("park_est1"));
		         String park_est2 = CmmUtil.nvl(request.getParameter("park_est2"));
		         String park_est3 = CmmUtil.nvl(request.getParameter("park_est3"));
		         String park_est4 = CmmUtil.nvl(request.getParameter("park_est4"));
		         String park_est5 = CmmUtil.nvl(request.getParameter("park_est5"));
		         String admin_name = CmmUtil.nvl(request.getParameter("admin_name"));	
		         String number = CmmUtil.nvl(request.getParameter("number"));
					
		         log.info("admin_no : " + admin_no);
		         log.info("park_name : " + park_name);
		         log.info("park_div : " + park_div);
		         log.info("addr1 : " + addr1);
		         log.info("addr2 : " + addr2);
		         log.info("lat : " + lat);
		         log.info("har : " + har);
		         log.info("park_area : " + park_area);
		         log.info("park_est1 : " + park_est1);
		         log.info("park_est2 : " + park_est2);
		         log.info("park_est3 : " + park_est3);
		         log.info("park_est4 : " + park_est4);
		         log.info("park_est5 : " + park_est5);
		         log.info("admin_name : " + admin_name);
		         log.info("number : " + number);
		         

		         parkDTO fDTO = new parkDTO();

		         fDTO.setAdmin_no(admin_no);
		         fDTO.setPark_name(park_name);
		         fDTO.setPark_div(park_div);
		         fDTO.setAddr1(addr1);
		         fDTO.setAddr2(addr2);
		         fDTO.setLat(lat);
		         fDTO.setHar(har);
		         fDTO.setPark_area(park_area);
		         fDTO.setPark_est1(park_est1);
		         fDTO.setPark_est2(park_est2);
		         fDTO.setPark_est3(park_est3);
		         fDTO.setPark_est4(park_est4);
		         fDTO.setPark_est5(park_est5);
		         fDTO.setAdmin_name(admin_name);
		         fDTO.setNumber(number);

		         mainService.apark_update(fDTO);
		         
		         msg = "수정되었습니다.";

		         url = "park_detail.do?admin_no=" + admin_no;

		         fDTO = null;

		      } catch (Exception e) {

		         msg = "실패하였습니다. : " + e.toString();
		         url = "park_E.do?admin_no=" + admin_no;

		         log.info(e.toString());
		         e.printStackTrace();

		      } finally {
		         log.info(this.getClass().getName() + "   parkUpdate end!");

		         // 결과 메시지 전달하기
		         model.addAttribute("msg", msg);
		         model.addAttribute("url", url);

		      }
		      return "/alert";
		   }

		 
		 
		 @RequestMapping(value = "/freeDelete")
		 
		   public String freeDelete(@RequestParam String fr_no, HttpSession session, HttpServletRequest request, HttpServletResponse response,
		         ModelMap model) throws Exception {
			 
		      log.info(this.getClass().getName() + "   FreeDelete start!");

		      log.info("fr_no : " + fr_no);

		      freeDTO pDTO = new freeDTO();

		      pDTO.setFr_no(fr_no);

		      int re = mainService.getfreeDelete(pDTO);
		      
		      if (re != 0) {
		    	  
		    	 mainService.getfreeDelete(fr_no);
		    	  
		         model.addAttribute("msg", "삭제되었습니다.");
		         model.addAttribute("url", "freeList.do");
		         
		      } else {
		    	  
		         model.addAttribute("msg", "실패하였습니다.");
		         model.addAttribute("url", "free_detail.do?fr_no=" + fr_no);
		      }
		      
		      log.info(this.getClass() + "    FreeDelete end!!");

		      return "/alert";
		   }
		 
		 
		 
		 @RequestMapping(value = "/parkDelete")

		   public String parkDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response,
		         ModelMap model) throws Exception {
			 
		      log.info(this.getClass().getName() + "   parkDelete start!");
		      
		      String admin_no = request.getParameter("admin_no");

		      log.info("admin_no : " + admin_no);

		      parkDTO pDTO = new parkDTO();

		      pDTO.setAdmin_no(admin_no);

		      int re = mainService.getparkDelete(pDTO);
		      
		      if (re != 0) {
		    	  
		    	 mainService.getparkDelete(admin_no);
		    	  
		         model.addAttribute("msg", "삭제되었습니다.");
		         model.addAttribute("url", "parkList.do");
		         
		      } else {
		    	  
		         model.addAttribute("msg", "실패하였습니다.");
		         model.addAttribute("url", "park_detail.do?admin_no=" + admin_no);
		      }
		      
		      log.info(this.getClass() + "    FreeDelete end!!");

		      return "/alert";
		   }
		 
		 
		 

		 
		 
		 
 
		 @RequestMapping(value="/my_page/Hinsert")
		  public @ResponseBody HoDTO favoriteInsert(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
		      throws Exception {
			 
			 
		  log.info(this.getClass().getName() + "   favoriteInsert start!");
		  
		  String user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  String admin_no = CmmUtil.nvl((String) req.getParameter("admin_no"));
		  String reg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		  String park_name1 = CmmUtil.nvl((String) req.getParameter("park_name"));
		  String park_name = TextUtil.exchangeEscapeNvl(park_name1);
		  
		  log.info("user_no : " + user_no);
		  log.info("admin_no : " + admin_no);
		  log.info("reg_no : " + reg_no);
		  log.info("park_name : " + park_name);
		  
		  HoDTO hDTO = new HoDTO();
		  
		  hDTO.setUser_no(user_no);
		  hDTO.setAdmin_no(admin_no);
		  hDTO.setReg_no(reg_no);
		  hDTO.setPark_name(park_name);
		  
		  mainService.favoriteInsert(hDTO);
		  
		  log.info(this.getClass().getName() + "favoriteInsert end!");
		  
		  return hDTO;
		  }
		  
		 /* ##############################
		  * #######<< 즐겨찾기 삭제  >>#########
		  * ##############################
		  */
		  @RequestMapping(value="/my_page/Hdelete")
		  public @ResponseBody int favoriteDelete(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
		      throws Exception {
			  
		   log.info(this.getClass().getName() + "favoriteDelete start!");
		   
		   String user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
		   String admin_no = CmmUtil.nvl(req.getParameter("admin_no"));
		   
		   log.info("user_no : " + user_no);
		   log.info("admin_no :" + admin_no);
		   
		   HoDTO hDTO = new HoDTO();
		   
		   hDTO.setAdmin_no(admin_no);
		   hDTO.setUser_no(user_no);
		   
		   log.info(this.getClass().getName() + "favoriteDelete end!");
		   
		   return mainService.favoriteDelete(hDTO);
		  }
		  
		  
			@RequestMapping(value = "/user_info/idCheck")
			public void idCheck(@RequestParam(value = "user_id") String user_id, HttpServletResponse response)
					throws Exception {
				
				
				log.info(this.getClass() + "idCheck start!!");
				
				mainDTO uDTO = new mainDTO();
				uDTO.setUser_id(user_id);

				int check = mainService.getUseridCheck(uDTO);

				System.out.println("check : " + check);

				response.getWriter().print(check);
				response.getWriter().flush();
				response.getWriter().close();

				log.info(this.getClass() + "idCheck end!!");
			}
			
			
			
			
			
			@RequestMapping(value="/free/freeMoreView")
			  public @ResponseBody List<freeDTO> reviewMoreView(@RequestParam(value = "count") String count) throws Exception{
				
				   freeDTO fDTO = new freeDTO();
				   
				   fDTO.setRead_more(count);
				   log.info("count :" + count);
				   
				   List<freeDTO> FreeMoreList = mainService.freeMoreView(fDTO);
				   
				   for(freeDTO f : FreeMoreList){
					  /* System.out.println("comment_count: "+f.getComment_count());*/
				   }
				   return FreeMoreList;
			  }

			  
			  @RequestMapping(value="free/insert")
			   //리턴데이터를 json으로 변환
			  public @ResponseBody int insert(@RequestParam int fr_no, 
					  
					   HttpSession session, HttpServletRequest request) throws Exception{
				   
				   log.info(this.getClass().getName() + "comment Insert start!");
				   
				   
				   String user_name = CmmUtil.nvl((String) session.getAttribute("session_user_name"));
				   String contentd = CmmUtil.nvl((String) request.getParameter("content"));
					String content = TextUtil.exchangeEscapeNvl(contentd);
					content = content.replace("\r\n", "<br>");
				   String user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
				   String reg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
				   String secret_check = CmmUtil.nvl(request.getParameter("secret_check"));
				   
				   
				   log.info("user_name : " + user_name);
				   log.info("fr_no : " + fr_no);
				   log.info("user_no : " + user_no);
				   log.info("content : " + content);
				   log.info("reg_no : " + reg_no);
				   log.info("secret_check: " + secret_check);
				   
				   fiDTO fiDTO = new fiDTO();
				   
				   fiDTO.setFr_no(fr_no);
				   fiDTO.setUser_name(user_name);
				   fiDTO.setUser_no(user_no);
				   fiDTO.setContent(content);
				   fiDTO.setReg_no(reg_no);
				   fiDTO.setSecret_check(secret_check);
				   
				   log.info(this.getClass().getName() + "comment Insert ok!");
				   
					   
					log.info(this.getClass().getName() + "comment list start!");
					   
					List<fiDTO> list =mainService.list(fiDTO);
					   
					log.info(this.getClass().getName() + "comment list ok!");
					   
					log.info(list);
					   
					return mainService.insert(fiDTO);
				   
			 }
				/* ##############################
				 * ########<< 댓글 수정  >>##########
				 * ##############################
				 */
			  @RequestMapping(value="free/update")
			  public @ResponseBody int update(@RequestParam int frc_no,@RequestParam String content, HttpSession session, HttpServletRequest request, HttpServletResponse response,
				         ModelMap model) throws Exception {
			  
				   log.info(this.getClass().getName() + ".CommentUpdate start!");
				   
				   fiDTO fiDTO = new fiDTO();
				   String contentd = TextUtil.exchangeEscapeNvl(content);
					content = contentd.replace("\r\n", "<br>");
					
				   //String secret_check = CmmUtil.nvl(request.getParameter("secret_check"));
					
				   String chg_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));

				   log.info("content: " + content);
				   //log.info("secret_check: " + secret_check);
				   log.info("chg_no: " + chg_no);

				   
				   fiDTO.setFrc_no(frc_no);
				   fiDTO.setContent(content);
				   //riDTO.setSecret_check(secret_check);
				   fiDTO.setChg_no(chg_no);
				   		
				   log.info(this.getClass().getName() + ".CommentUpdate end!");
				   
				   return mainService.update(fiDTO);
				   
			}
						   
				   
				/* ##############################
				 * ########<< 댓글 삭제  >>##########
				 * ##############################
				 */
			  @RequestMapping(value="free/delete")
			  public @ResponseBody int delete(@RequestParam int frc_no, HttpSession session, HttpServletRequest request, HttpServletResponse response,
				         ModelMap model) throws Exception {
				   log.info(this.getClass().getName() + ".Comment delete start!");

				   log.info(this.getClass()+ ".Comment delete end!");
				   
				   return mainService.delete(frc_no);
			  }
			  
			  /* ##############################
				* ########<< 댓글 목록  >>##########
				* ##############################
				*/
			 @RequestMapping("free/list")
			 @ResponseBody //리턴데이터를 json으로 변환
			 public List<fiDTO> list(Model model, HttpServletRequest req) throws Exception{
				   
				   log.info(this.getClass().getName() + "comment list start!");
				  String sfi_no = CmmUtil.nvl(req.getParameter("fr_no"));
				  int fr_no = Integer.parseInt(sfi_no);
				   
				   fiDTO fic = new fiDTO();
				   fic.setFr_no(fr_no);
				   log.info(this.getClass().getName() + "comment list ok!");
				   
				   List<fiDTO> list = mainService.list(fic);
				   
				   log.info("List : "+ list);
				   
				   return mainService.list(fic);
			 }
			 
			
			
			
		
	}

