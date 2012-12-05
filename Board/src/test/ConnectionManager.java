package test;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class  ConnectionManager{
	
	public Connection getConnection(){

		Connection conn=null;
		
		String jdbcUrl= "jdbc:mysql://localhost:3306/web2012";
		String dbId= "web";
		String dbPass= "asdf";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}

	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) throws SQLException{

		if(rs != null){rs.close();}
		if(pstmt != null){pstmt.close();}
		if(conn != null){conn.close();}
	}

	public void close(PreparedStatement pstmt, Connection conn) throws SQLException{

		if(pstmt != null){pstmt.close();}
		if(conn != null){conn.close();}
	}
		
}


		