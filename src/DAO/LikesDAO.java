package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Util.ConnectionPool;

public class LikesDAO {

	@SuppressWarnings("resource")
	public String like(int uno, int pno) throws Exception {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql1 = "SELECT * FROM likes WHERE uno = ? AND pno = ?";
			st = conn.prepareStatement(sql1);
			st.setInt(1, uno);
			st.setInt(2, pno);
			rs = st.executeQuery();
			
			String res = (rs.next()) ? "ALREADY" : "OK";
			
			if(res.equals("OK")) {
				String sql2 = "INSERT INTO likes (pno, uno) VALUES (?, ?)";
				st = conn.prepareStatement(sql2);
				st.setInt(1, pno);
				st.setInt(2, uno);
				st.executeUpdate();
			}else {
				String sql2 = "DELETE FROM likes WHERE pno = ? AND uno = ?";
				st = conn.prepareStatement(sql2);
				st.setInt(1, pno);
				st.setInt(2, uno);
				st.executeUpdate();
			}
			
			return res;
			
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
	
	public ArrayList<Integer> likeList(int uno) throws Exception {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql1 = "SELECT pno FROM likes WHERE uno = ?";
			st = conn.prepareStatement(sql1);
			st.setInt(1, uno);
			rs = st.executeQuery();
			
			ArrayList<Integer> list = new ArrayList<Integer>();
			while(rs.next()) {
				int pno = rs.getInt(1);
				list.add(pno);
			}
			
			return list;
			
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
}
