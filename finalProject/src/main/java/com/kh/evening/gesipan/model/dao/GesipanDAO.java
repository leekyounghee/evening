package com.kh.evening.gesipan.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.evening.board.model.vo.PageInfo;
import com.kh.evening.gesipan.model.vo.Gesipan;

@Repository("gDAO")
public class GesipanDAO {

	public int insertGesipan(SqlSessionTemplate sqlSession, Gesipan g) {
		return sqlSession.insert("gMapper.insertGesipan", g);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("gMapper.selectListCount", category);
	}

	public ArrayList<Gesipan> selectGesipanList(SqlSessionTemplate sqlSession, PageInfo pi, String category) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gMapper.selectGesipanList", category, rb);
	}

	public int selectSearchListCount(SqlSessionTemplate sqlSession, Map<String, String> parameters) {
		return sqlSession.selectOne("gMapper.selectSearchListCount", parameters);
	}

	public ArrayList<Gesipan> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			Map<String, String> parameters) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gMapper.selectSearchList", parameters, rb);
	}
	


	/*public int getCListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gMapper.selectCListCount");
	}
	public int getSListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gMapper.selectSListCount");
	}
	public int getQListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gMapper.selectQListCount");
	}*/

	/*public ArrayList<Gesipan> selectCommunityList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gMapper.selectCommunityList", null, rb);
	}

	public ArrayList<Gesipan> selectSellingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gMapper.selectSellingList", null, rb);
	}

	public ArrayList<Gesipan> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gMapper.selectQnaList", null, rb);
	}*/

	

}
