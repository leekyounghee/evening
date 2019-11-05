package com.kh.evening.payment.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	
	private int P_NO;			// 결제 리스트 번호
	private String P_ID;		// 결제자 아이디
	private String P_NICKNAME;	// 결제자 닉네임
	private String P_EMAIL;		// 결제자 이메일
	private Date PAYDAY;		// 결제 날짜
	private Date P_UPDATE_DATE;	// 결제 수정 날짜
	private String P_STATUS;	// 결제 상태
	private int MONEY;			// 결제 금액




	
}
