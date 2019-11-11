package com.kh.evening.message.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.evening.message.model.service.MessageService;
import com.kh.evening.message.model.vo.Message;

@Controller
public class MessageController {

  @Autowired
  private MessageService mService;

  @RequestMapping("massageList.ms")
  public ModelAndView auctionList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv, @RequestParam(value="mode", required=false) String mode) {
	  
	  ArrayList<Message> lists = mService.messageList(new Message());
	  if(lists != null && lists.size() > 0) {
		  System.out.println(">>>>>>>>>>" + lists.get(0).getUSER_ID());
	  } else {
		  System.out.println(">>>>>>>> list is nulls");
	  }
	  mv.addObject("list", "");
	  return mv;
  }

}
