package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Util.ConnectionPool;
import VO.PoemVO;

public class PoemDAO {

	public String insert(PoemVO vo) throws Exception {
		
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "INSERT INTO poem ";
			sql += "(title, contents, uno, time) ";
			sql += "VALUES (?, ?, ?, now())";
			
			st = conn.prepareStatement(sql);
			st.setString(1, vo.getTitle());
			st.setString(2, vo.getContents());
			st.setInt(3, vo.getUno());
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
	
	public ArrayList<PoemVO> poemList() throws Exception {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "SELECT * FROM poem";
			
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			ArrayList<PoemVO> list = new ArrayList<PoemVO>();
			while(rs.next()) {
				PoemVO vo = new PoemVO();
				
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContents(rs.getString(3));
				vo.setLike(rs.getInt(4));
				vo.setUno(rs.getInt(5));
				vo.setTime(rs.getTimestamp(6));
				vo.setReport(rs.getInt(7));
				
				list.add(vo);
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
