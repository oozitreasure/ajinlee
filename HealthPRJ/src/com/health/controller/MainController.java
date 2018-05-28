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
	
	@RequestMapping(value="free_detail", method=RequestMethod.GET)
	public String free_detail(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "free_detail";
		
	}
	
	@RequestMapping(value="free_insert", method=RequestMethod.GET)
	public String free_insert(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "free_insert";
		
	}
	
	@RequestMapping(value="mypage3", method=RequestMethod.GET)
	public String mypage3(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "mypage3";
		
	}
	
	@RequestMapping(value="park_detail", method=RequestMethod.GET)
	public String park_detail(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "park_detail";
		
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
	
	@RequestMapping(value = "/mypage2")
	public String mypage2(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
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
		
		return "/mypage2";
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
	public String PwSearchProc(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   pw_search_proc start!!!");

		String user_no = re.getParameter("user_no");
		String user_name = re.getParameter("user_name");
		String user_id = re.getParameter("user_id");
		String email = re.getParameter("email");

		log.info(this.getClass() + "user_name : " + user_name);
		log.info(this.getClass() + "user_id : " + user_id);
		log.info(this.getClass() + "email :" + email);
		log.info(this.getClass() + "user_no : " + user_no);

		mainDTO kDTO = new mainDTO();

		kDTO.setUser_name(user_name);
		kDTO.setUser_id(user_id);
		kDTO.setEmail(email);

		kDTO = mainService.getPassword(kDTO);

		if (kDTO != null) {
			model.addAttribute("msg", "비밀번호변경페이지로 이동합니다.");
			model.addAttribute("url", "home.do");
			session.setAttribute("session_user_no", kDTO.getUser_no());
		} else {
			model.addAttribute("msg", "일치하는 회원이 없습니다. 다시 확인해주세요");
			model.addAttribute("url", "PWDs.do");
		}
		kDTO = null;
		
		log.info(this.getClass() + "   pw_search_proc end!!!");
		
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
	
	
	@RequestMapping(value="/getSearch")
	public @ResponseBody List<parkDTO> getSearch(@RequestParam(value = "search") String search)throws Exception{
		
		log.info(this.getClass() + "   parksearch start!!!");
		
		parkDTO fDTO = new parkDTO();
		
		fDTO.setSearch("%"+search+"%");
		
		log.info("search : " + search);
		
		List<parkDTO> flist = mainService.getSearch(fDTO);
		
		
		log.info(this.getClass() + "   parksearch end!!!");
		
		return flist;
	}
	

	}