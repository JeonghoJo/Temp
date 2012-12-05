package wp.resultboard;

import java.util.*;
import java.sql.*;

public class ResultBean {
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_url="jdbc:mysql://localhost:3306/web2012";
	
	void connect()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbc_url, "web", "asdf");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	void disconnect()
	{
		if(pstmt != null)
		{
			try{
				pstmt.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		if(conn !=null)
		{
			try{
				conn.close();
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Result> getDBList()
	{
		connect();
		String sql = "select * from information";
		ArrayList<Result> datas = new ArrayList<Result>();
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Result result = new Result();
				result.setId(rs.getInt("id"));
				result.setDestination(rs.getString("destination"));
				result.setLine(rs.getString("line"));
				result.setStation(rs.getString("station"));
				result.setDistance(rs.getInt("distance"));
				result.setCategory(rs.getString("category"));
				result.setDiscription(rs.getString("discription"));
				result.setPicture(rs.getString("picture"));
				result.setHomepage(rs.getString("homepage"));
				result.setRecommend(rs.getInt("recommend"));
				
				datas.add(result);
			}
			rs.close();		
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			disconnect();
		}
		return datas;
		
	}
	
	public ArrayList<Result> getLocationList(String location)
	{
		connect();
		String sql = "select * from information";
		ArrayList<Result> datas = new ArrayList<Result>();
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			
			
			while(rs.next())
			{
				
				if(rs.getString("station").equals(location))
				{
					
					Result result = new Result();
					result.setId(rs.getInt("id"));
					result.setDestination(rs.getString("destination"));
					result.setLine(rs.getString("line"));
					result.setStation(rs.getString("station"));
					result.setDistance(rs.getInt("distance"));
					result.setCategory(rs.getString("category"));
					result.setDiscription(rs.getString("discription"));
					result.setPicture(rs.getString("picture"));
					result.setHomepage(rs.getString("homepage"));
					result.setRecommend(rs.getInt("recommend"));
					
					datas.add(result);
				}
			
			}
			rs.close();		
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			disconnect();
		}
		return datas;
		
	}
	public ArrayList<Result> getThemeList(String theme)
	{
		connect();
		String sql = "select * from information";
		ArrayList<Result> datas = new ArrayList<Result>();
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			
			
			while(rs.next())
			{
				if(rs.getString("category").equals(theme))
				{
					Result result = new Result();
					result.setId(rs.getInt("id"));
					result.setDestination(rs.getString("destination"));
					result.setLine(rs.getString("line"));
					result.setStation(rs.getString("station"));
					result.setDistance(rs.getInt("distance"));
					result.setCategory(rs.getString("category"));
					result.setDiscription(rs.getString("discription"));
					result.setPicture(rs.getString("picture"));
					result.setHomepage(rs.getString("homepage"));
					result.setRecommend(rs.getInt("recommend"));
					
					datas.add(result);
				}
			
			}
			rs.close();		
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			disconnect();
		}
		return datas;
		
	}
	public Result getMybag (String destination)
	{
		connect();
		String sql = "select * from information where destination=?";
		Result result = new Result();
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, destination);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			result.setId(rs.getInt("id"));
			result.setDestination(rs.getString("destination"));
			result.setLine(rs.getString("line"));
			result.setStation(rs.getString("station"));
			result.setDistance(rs.getInt("distance"));
			result.setCategory(rs.getString("category"));
			result.setDiscription(rs.getString("discription"));
			result.setPicture(rs.getString("picture"));
			result.setHomepage(rs.getString("homepage"));
			result.setRecommend(rs.getInt("recommend"));
			rs.close();	
				
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			disconnect();
		}
		return result;
	}
	
}
