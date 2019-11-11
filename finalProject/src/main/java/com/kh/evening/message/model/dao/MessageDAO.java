package com.kh.evening.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.evening.message.model.vo.Message;

@Repository("MessageDAO")
public class MessageDAO {

//    return sqlSession.selectOne("MessageMapper.getAuctionListCount");
	public ArrayList<Message> selectMassageList(SqlSession sqlSession, Message me) {
		return (ArrayList)sqlSession.selectList("messageMapper.selectMessageList",me);
  }

  
}
