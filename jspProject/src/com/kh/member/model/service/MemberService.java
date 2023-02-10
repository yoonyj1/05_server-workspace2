package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		// Connection 객체 생성
		Connection conn = getConnection();
		
		// dao 호출
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	} // loginMember end
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		// 트랜젝션 처리
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	} // insertMember end
	
	public Member updateMember(Member m) {
		// Connection 객체 생성
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) { // update 성공
			commit(conn);
			
			// 갱신 된 회원객체를 다시 조회
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		} else { // update 실패
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	} // updateMember end
}
