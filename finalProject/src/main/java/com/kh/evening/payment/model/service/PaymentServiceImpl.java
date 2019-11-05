package com.kh.evening.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.evening.payment.model.dao.PaymentDAO;

@Service("pService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDAO pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
