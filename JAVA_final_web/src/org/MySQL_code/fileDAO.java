package org.MySQL_code;

import java.sql.*;

public class fileDAO {
	private Connection conn;

	public fileDAO() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("org.MySQL_code.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false&allowPublicKeyRetrieval=true", "root", "9037");
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
	public int upload(String title , String wr_content, String fileName, String fileRealName, String userid, String price, String address) {
		//String SQL = "INSERT INTO FILE VALUES (?, ?)";
		String SQL = "INSERT INTO RENDER(title, rend_date, content, filename, filerealname,id, price, address) VALUES( ?,SYSDATE(),?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, wr_content);
			pstmt.setString(3, fileName);
			pstmt.setString(4, fileRealName);
			pstmt.setString(5, userid);
			pstmt.setString(6, price);
			pstmt.setString(7, address);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("#### �������");
		}

		return -1;
	}
	//upload(userid, price, deliveryYN)
	
		public int uploadBorrow(String num, String userid , String price, String deliveryYN) {
			String SQL = "INSERT INTO BORROWER(NUM ,ID, BORROW_DATE, PRICE, DELIVERY_YN) VALUES(?, ?,SYSDATE(),?,?)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, num);
				pstmt.setString(2, userid);
				pstmt.setString(3, price);
				if (deliveryYN == "on") { pstmt.setString(4, "Y");}
				else {pstmt.setString(4, "N");}

				return pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("#### �������");
			}

			return -1;
		}
	
}
