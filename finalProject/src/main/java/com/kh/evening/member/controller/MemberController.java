package com.kh.evening.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Manager;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.evening.member.email.Email;
//import com.kh.evening.member.email.EmailSender;
import com.kh.evening.member.model.exception.MemberException;
import com.kh.evening.member.model.service.MemberService;
import com.kh.evening.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
   
   @Autowired
   private MemberService mService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   // 이메일 보내기 Autowired
   /*@Autowired
   private EmailSender emailSender;*/
   
//   @Autowired
//   private Email email;
   
   /*@Autowired
   JavaMailSender mailSender;*/
   
   
   @RequestMapping("myinfo.me")
   public String myinfo() {
      return "myinfo";
   }
   
   @RequestMapping("favorites.me")
   public String favorites() {
      return "favorites";
   }
   
   @RequestMapping("dealDetail.me")
   public String dealDetail() {
      return "dealDetail";
   }
   
   @RequestMapping("mypost.me")
   public String mypost() {
      return "mypost";
   }
   
   @RequestMapping("updateAucView.me")
   public String updateAucView() {
      return "updateAuc";
   }
   
   
   // 아이디 비밀번호 찾기 컨트롤러
   @RequestMapping("searchidpwd.me")
   public String searchidpwd() {
      return "searchidpwd";
   }
   
   // 회원가입용 컨트롤러
   
   
   @RequestMapping("ebinsert.me")
   public String insertMember(@ModelAttribute Member m,
                     @RequestParam("zipcode1") String zipcode1,
                     @RequestParam("addr") String addr,
                     @RequestParam("addrDtl")String addrDtl) {
      
   m.setAddress(  zipcode1 + "/" + addr + "/" +addrDtl);
   
   // 비밀번호 암호화
   
   String encPwd = bcryptPasswordEncoder.encode(m.getUser_pwd());
   m.setUser_pwd(encPwd);
   
   System.out.println(m);
   
   int result = mService.insertMember(m);
   
   if(result > 0) {
      return "redirect:home.do";
   }else {
      throw new MemberException("회원가입에 실패하였습니다.");
   }
      
      
      
   }
   
   // 로그인용 컨트롤러
   @RequestMapping("login.me")
   public String login() {
      return "login";
   }
   
   // 암호화 후 로그인
   @RequestMapping(value="login.me", method=RequestMethod.POST)
   public String memberLogin(@ModelAttribute Member m ,Model model) {
      Member loginUser = mService.memberLogin(m);
   
      
      if(bcryptPasswordEncoder.matches(m.getUser_pwd(), loginUser.getUser_pwd())) {
         model.addAttribute("loginUser",loginUser);
         
      }else {
         throw new MemberException("로그인에 실패하였습니다.");
      }
      return "redirect:home.do";
      
   }
   
   @RequestMapping(value="searchId.me", method=RequestMethod.POST)
   public String searchId(@ModelAttribute Member m, Model model) {
      
      Member searchId = mService.searchId(m);
      
      if((m.getUser_name().equals(searchId.getUser_name()) && m.getPhone().equals(searchId.getPhone()))) {
         // 이름과 전화 번호 정보가 같으면 이제 내가 찾는 아이디를 출력 해야 한다. 어떻게?
         // 어떻게 출력을 할까 말까 ㅁㅇ민 ㅕㅎ레 ㅑㄴㅇ ㅗㅎㄴ 오히ㅓ ㅌ ㅍㄴ윺 ㅓㅎㄴㅍㄹ치.ㄴㅌㅇㅎㄿ늌ㅇ ㅍ토ㅓ
         // ajax 로 할수 잇는지 , 아니면 팝업창 또는 alert 창으로 띄어야 하는지
          model.addAttribute("searchId",searchId);
         
         
         
      }else {
         throw new MemberException("아이디 찾기에 실패하였습니다.");
      }
      return "login";
   }
   
   
   
   
   
   @RequestMapping("dupid.me")
   public void idDuplicataCheck(HttpServletResponse response, String user_id) throws IOException {
   boolean isUsable = mService.checkIdDup(user_id) == 0 ? true : false;
   
   response.getWriter().print(isUsable);
   }
   
   
   
   
   
   
   // 아이디 비밀번호 찾기 컨트롤러
   @RequestMapping("search.me")
   public String Search(){
      
      return "SearchIdPwd";
   }


   
/*   @RequestMapping(value="searchId", method=RequestMethod.POST)
   public String searchId(HttpServletResponse response,
                     @RequestParam("user_name")String user_name,
                     @RequestParam("user_email")String user_email,
                     Model model)   {
      
      model.addAttribute("user_id", mService.searchId(response,user_email, user_name));
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      
      String user_id = Manager.searchId(user_name,user_email);
      
      
      
      return "login";
      }*/
   
   
   
   
   
   /*@RequestMapping("searchId.me")
   public String SearchId(Member m, Model model) {
      Member searchId = mService.searchId(m);
      
      if( searchId != null) {
         model.addAttribute("searchid", searchId);
            
         
         
         
      }else {
         throw new MemberException("아이디 조회에 실패하였습니다.");
         
      }
      return "login";
      
   }*/
   
   
   
/*   @RequestMapping("searchPwd.me")
   public ModelAndView sendEmaiAction(@RequestParam Map<String, Object> paramMap, 
                              ModelMap model ) {
            
      // 비밀번호 이메일로 보내기
      ModelAndView mav;
      String id = (String) paramMap.get("user_id");
      String e_mail= (String) paramMap.get("user_email");
      String user_pwd = mService.getPw(paramMap);
      System.out.println(user_pwd);
      
      if(user_pwd != null) {
         email.setContent("고객님께서 요청하신 비밀번호는 " + user_pwd + " 입니다.");
         email.setReceiver(e_mail);
         email.setSubject("evening에서 보내드리는 "+ id + "님의 비밀번호 메일입니다.");
         emailSender.SendMail(email);
         mav = new ModelAndView("redirect:login");
         return mav;
      }else {
         throw new MemberException("메일발송에 실패하였습니다.");
         
      }
   }
*/      
      
      
      
      
   
      
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}