package com.kh.water.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.water.model.dao.WaterDao;
import com.kh.water.model.vo.Water;

import static com.kh.common.JDBCTemplate.*;



public class WaterService {
	public int insertWater(String name, int price) {
		Connection conn = getConnection();
		
		int result = new WaterDao().insertWater(conn, name, price);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Water> selectWater() {
		Connection conn = getConnection();
		
		ArrayList<Water> list = new WaterDao().selectWater(conn);
		
		close(conn);
		
		return list;
	}
	
	public int updateWater(int no, String name, int price) {
		Connection conn = getConnection();
		
		int result = new WaterDao().updateWater(conn, no, name, price);
		
		if (result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
