package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import Util.ConnectionPool;
import VO.UserVO;

public class UserDAO {

	public int login(UserVO vo) throws SQLException, NamingException {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "SELECT * FROM USER WHERE id = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, vo.getId());
			rs = st.executeQuery();
			while(rs.next()) {
				if(rs.getString(2).equals(vo.getId()) && rs.getString(3).equals(vo.getPw())) {
					return rs.getInt(1);
				}
			}
			
			return -1;
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(st != null) {
				st.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}
	
	public String signup(UserVO vo) throws SQLException, NamingException {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "INSERT INTO user ";
			sql += "(id, pw, power) ";
			sql += "VALUES (?, ?, 1)";
			st = conn.prepareStatement(sql);
			st.setString(1, vo.getId());
			st.setString(2, vo.getPw());
			int cnt = st.executeUpdate();
					
			return (cnt== 0) ? "ER" : "OK";
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(st != null) {
				st.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}
	
	public UserVO user(int uno) throws SQLException, NamingException {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "SELECT * FROM USER WHERE no = ?";
			st = conn.prepareStatement(sql);
			st.setInt(1, uno);
			rs = st.executeQuery();
			
			UserVO vo = new UserVO();
			while(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setPw(rs.getString(3));
				vo.setContents_count(rs.getInt(4));
				vo.setLike_count(rs.getInt(5));
				vo.setComment_count(rs.getInt(6));
				vo.setPower(rs.getInt(7));
			}
			
			return vo;
			
		}finally {
			if(rs != null) {
				rs.close();
			}
			if(st != null) {
				st.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}
	
	public String like(int uno) throws Exception {

		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql1 = "UPDATE user SET like_count = like_count + 1 WHERE no = ?";
			st = conn.prepareStatement(sql1);
			st.setInt(1, uno);
			int cnt = st.executeUpdate();
			
			return (cnt== 0) ? "ER" : "OK";
			
		}finally {
			if(st != null) {
				st.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}
}
