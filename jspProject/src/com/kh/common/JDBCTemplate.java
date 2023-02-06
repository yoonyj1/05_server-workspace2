package com.kh.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTemplate {
	// 싱글톤 패턴 적용해서 jdbc 템플릿 작성(한 번 생성하고 계속 꺼내쓰는 방식)
	
	// 1. Connection 객체 생성 후 해당 Connection 객체를 반환해주는 getConnection 메소드
	public static Connection getConnection() {
		Connection conn = null;
		
		// ojdbc6.jar => WEB-INF/lib에 복붙
		
		try {
			// jdbc driver 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 접속하고자 하는 DB의 url, 계정, 비밀번호 제시해서 Connection 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SERVER", "SERVER");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 2-1. Connection 객체 전달받아서 commit 시켜주는 commit 메소드 
	// 2-2. Connection 객체 전달받아서 rollback 시켜주는 rollback 메소드
	
	// 3-1. Connection 객체 전달받아서 반납시켜주는 close 메소드
	
	// 3-2. Statement 객체 전달받아서 반납시켜주는 close 메소드
	
	// 3-3. ResultSet 객체 전달받아서 반납시켜주는 close 메소드
}
