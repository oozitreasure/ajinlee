package com.health.controller;

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

import com.health.DTO.mainDTO;
import com.health.service.IMainService;
import com.health.service.impl.MainService;
import com.health.util.CmmUtil;
	
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "MainService")
	private IMainService mainService;
	

	@RequestMapping(value="home", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "home";
		
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "register";
		
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
	
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String board(HttpServletRequest request, HttpServletResponse response, 
					ModelMap model) throws Exception {
		return "board";
		
	}
	
	@RequestMapping(value = "/user_info/Login")
	public String Login(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		return "/user_info/Login";
	}

	@RequestMapping(value = "/login_proc")
	public String login_proc(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "login_proc start!!!");

		String user_id = re.getParameter("user_id");
		String password = /*SHA256.SHA256_encode(*/re.getParameter("password");

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
			returnURL = "/home";
			
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
	
	
	@RequestMapping(value = "mypage")
	public String mypage(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		return "mypage";
	}
	
	
	@RequestMapping(value = "/user_detail")
	public String user_detail(HttpServletRequest re, HttpServletResponse resp, Model model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass() + "   user_detail start!!!");
		
		String user_no = CmmUtil.nvl(re.getParameter("user_no"));
		
		mainDTO gDTO = mainService.getUserInfoOne(user_no);
		
		if (gDTO == null) {
			gDTO = new mainDTO();
		}
		model.addAttribute("gDTO", gDTO);
		
		log.info(this.getClass() + "   user_detail end!!!");
		
		return "/user_detail";
	}
	

		

}