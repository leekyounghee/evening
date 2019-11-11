package com.kh.evening.message.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.message.model.dao.MessageDAO;
import com.kh.evening.message.model.vo.Message;

@Service("MessageService")
public class MessageService {
  
  @Autowired
  private SqlSession sqlSession;
  
  @Autowired
  private MessageDAO mDAO;

  public ArrayList<Message> messageList(Message me) {
    return mDAO.selectMassageList(sqlSession, me);
  }

}
