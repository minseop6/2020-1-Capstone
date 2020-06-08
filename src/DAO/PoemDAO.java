package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

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
}
