package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Util.ConnectionPool;
import VO.CommentVO;

public class CommentDAO {

	public String insert(CommentVO vo) throws Exception {
		
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql1 = "UPDATE user SET comment_count = comment_count + 1 WHERE no = ?";
			st = conn.prepareStatement(sql1);
			st.setInt(1, vo.getUno());
			st.executeUpdate();
			
			String sql2 = "INSERT INTO comment ";
			sql2 += "(contents, pno, uno, id) ";
			sql2 += "VALUES (?, ?, ?, ?)";
			
			st = conn.prepareStatement(sql2);
			st.setString(1, vo.getContents());
			st.setInt(2, vo.getPno());
			st.setInt(3, vo.getUno());
			st.setString(4, vo.getId());
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
	
	public ArrayList<CommentVO> commentList(int pno) throws Exception {
		
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.getInstance().getConn();
			
			String sql = "SELECT * FROM comment WHERE pno = ?";
			
			st = conn.prepareStatement(sql);
			st.setInt(1, pno);
			rs = st.executeQuery();
			
			ArrayList<CommentVO> list = new ArrayList<CommentVO>();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				
				vo.setNo(rs.getInt(1));
				vo.setContents(rs.getString(2));
				vo.setPno(rs.getInt(3));
				vo.setUno(rs.getInt(4));
				vo.setId(rs.getString(5));
				
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
