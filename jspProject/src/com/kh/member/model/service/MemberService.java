package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;

public class MemberService {

	public void loginMember(String userId, String userPwd) {
		// Connection 객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// dao 호출
		new MemberDao().loginMember(conn, userId, userPwd);
	}
}
