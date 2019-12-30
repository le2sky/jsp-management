package modeler;

import java.sql.SQLException;

public class CrudModeler extends DataBaseModeler {
	public CrudModeler() {
		super();
	}
	
	public void createRecord(String p_name, int  p_price, int  p_stock) {
		connect();
		String SQL = "insert into nike_product_tbl value(?,?,?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, p_name);
			pstmt.setInt(2, p_price);
			pstmt.setInt(3, p_stock);
			pstmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	public void deleteRecord(String p_name) {
		connect();
		String SQL = "delete from nike_product_tbl where productName=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, p_name);
			pstmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
	
	public void updateRecord(String p_name, int p_price, int p_stock) {
		connect();
		String SQL = "update nike_product_tbl set productPrice=?, stockCount=? where productName=?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, p_price);
			pstmt.setInt(2, p_price);
			pstmt.setString(3, p_name);
			pstmt.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
	}
	
}
