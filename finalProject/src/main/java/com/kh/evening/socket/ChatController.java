package com.kh.evening.socket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.member.model.vo.Member;
@Controller
public class ChatController {
	
	@RequestMapping("chat.ch")
	public String chattingPage(){
		System.out.println("Controller");
		return "chat-ws";
	}
}
