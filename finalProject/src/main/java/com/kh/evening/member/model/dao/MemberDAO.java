package com.kh.evening.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.member.model.vo.Member;


@Repository("mDAO")
public class MemberDAO {

   public int insertMember(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.insert("memberMapper.insertMember",m);
   }

   public int checkIdDup(SqlSessionTemplate sqlSession, String user_id) {
      return sqlSession.selectOne("memberMapper.idCheck", user_id);
   }

   public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.selectOne",m);
   }

   public Member searchId(SqlSessionTemplate sqlSession, Member m) {
      return sqlSession.selectOne("memberMapper.searchId", m);
   }

//   public Member searchId(SqlSessionTemplate sqlSession, String user_name,String user_email) {
//      return (Member) sqlSession.selectMap("memberMapper.searchId",user_name,user_email);
//   }

//   public String getPw(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
//      return sqlSession.selectOne("memberMapper.getPw", paramMap);
//   }

   
   
}