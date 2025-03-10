package com.kh.evening.board.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.evening.board.model.exception.BoardException;
import com.kh.evening.board.model.service.BoardServiceImp;
import com.kh.evening.board.model.vo.Attachment;
import com.kh.evening.board.model.vo.Board;
import com.kh.evening.board.model.vo.BoardMode;
import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.common.Pageination;

@Controller
public class BoardController {

  @Autowired
  private BoardServiceImp bService;

  @RequestMapping("auctionList.bo")
  public ModelAndView auctionList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv, @RequestParam(value="mode", required=false) String mode) {
    int currentPage = 1;
    if (page != null) {
      currentPage = page;
    }
    
    String modeSet = "recent";
    if (mode != null) {
      modeSet = mode;
    }
    
    String boardCategory = "A";
    int listCount = bService.getBoardListCount(boardCategory);
    PageInfo pi = Pageination.getPageInfo(currentPage, listCount);

    BoardMode bMode = new BoardMode(modeSet, boardCategory);
    
    ArrayList<Board> alist = bService.boardList(pi,bMode);
    ArrayList<Attachment> af = bService.boardFileList();
    
    if (alist != null) {
      mv.addObject("alist", alist);
      mv.addObject("pi",pi);
      mv.addObject("modeSet",modeSet);
      mv.addObject("af", af);
      mv.setViewName("auctionBoard");
    } else {
      throw new BoardException("경매 게시판 조회 실패.");
    }

    return mv;
  }
  
  @RequestMapping("secondgoodList.bo")
  public ModelAndView secondGoodList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, @RequestParam(value="mode", required=false) String mode) {
    int currentPage = 1;
    if (page != null) {
      currentPage = page;
    }
    
    String modeSet = "recent";
    if (mode != null) {
      modeSet = mode;
    }
    
    String boardCategory = "SG";
    int listCount = bService.getBoardListCount(boardCategory);
    PageInfo pi = Pageination.getPageInfo(currentPage, listCount);
    
    BoardMode bMode = new BoardMode(modeSet, boardCategory);

    ArrayList<Board> alist = bService.boardList(pi,bMode);
    ArrayList<Attachment> af = bService.boardFileList();
    
    if (alist != null) {
      mv.addObject("alist", alist);
      mv.addObject("pi",pi);
      mv.addObject("af", af);
      mv.addObject("modeSet", modeSet);
      mv.setViewName("secondGoodBoard");
    } else {
      throw new BoardException("중고 게시판 조회 실패.");
    }
    
    return mv;
  }

}
