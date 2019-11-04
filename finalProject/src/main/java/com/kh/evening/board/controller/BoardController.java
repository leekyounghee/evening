package com.kh.evening.board.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.service.BoardService;
import com.kh.evening.board.model.vo.Board;

@Controller
public class BoardController {
  
  @Autowired
  private BoardService bService;
  
  @RequestMapping("auctionList.bo")
  public String auctionList(Model model) {
    
    ArrayList<Board> alist = bService.boardList();
    
    if( alist != null)
      model.addAttribute("alist",alist);
    else
      throw new BoardException("경매 게시판 조회 실패.");
    
    return "auctionBoard";
  }

}
