package org.MySQL_code;

import java.sql.*;

public class DriverSQL {
	
	public static void main(String[] args) {
		Connection con = null;	
		PreparedStatement pstmt = null;
		
		try {				
			Class.forName("org.MySQL_code.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","9037");
			String sql = "insert member values('60132232','마쵸','sangnamja')";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			System.out.println("SQL 성공: "+con);
		} catch(SQLException ex) {
			System.out.println("SQLException"+ex);
		} catch(Exception ex) {
			System.out.println("Exception"+ex.getMessage());
		}
}

}
