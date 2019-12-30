package modeler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseModeler {
	protected static final String JDBC_DRIVER ="com.mysql.cj.jdbc.Driver";
	protected static final String JDBC_URL ="jdbc:mysql://localhost:3306/nikeManager_DataBase?serverTimezone=Asia/Seoul";
	protected static final String USER = "root";
	protected static final String PASSWD =""; //input your database password
	
	protected Connection con = null;
	protected Statement stmt = null;
	protected PreparedStatement pstmt = null;
	
	
	
	public DataBaseModeler() {
		try {
			Class.forName(JDBC_DRIVER);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void connect() {
		try {
			con = DriverManager.getConnection(JDBC_URL,USER, PASSWD);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disconnect() {
		if(stmt != null) {
			try {
				stmt.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
