package com.kh.evening.board.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.evening.board.model.vo.Board;

@Repository("bDAO")
public class BoardDAO {

  public ArrayList<Board> boardList(SqlSession sqlSession) {
    return (ArrayList)sqlSession.selectList("boardMapper.boardList");
  }

  
}
