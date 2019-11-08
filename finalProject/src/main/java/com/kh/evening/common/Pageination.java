package com.kh.evening.common;

import com.kh.evening.board.model.vo.PageInfo;

public class Pageination {

  public static PageInfo getPageInfo(int currentPage, int listCount) {
    PageInfo pi = null;

    int pageLimit = 5;
    int maxPage;
    int startPage;
    int endPage;
    int boardLimit = 6;

    maxPage = (int) ((double) listCount / boardLimit + 0.9);

    startPage = (((int) ((double) currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;

    endPage = startPage + pageLimit - 1;

    if (maxPage < endPage)
      endPage = maxPage;

    pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

    return pi;
  }


}
