package modeler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductListModeler extends DataBaseModeler {
	public ProductListModeler() {
		super();
	}
	
	public ArrayList<Product> getAllList(){
		connect();
		ArrayList<Product> list = new ArrayList<Product>();
		String SQL = "select * from nike_product_tbl";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				Product temp = new Product();
				temp.setProductName(rs.getString("productName"));
				temp.setProductPrice(rs.getInt("productPrice"));
				temp.setStockCount(rs.getInt("stockCount"));
				list.add(temp);
			}
			rs.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<Product> getFindList(String keyword){
		connect();
		ArrayList<Product> list =new ArrayList<Product>();
		String search_keyword = keyword + "%";
		String SQL = "select * from nike_product_tbl where productName like ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, search_keyword);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Product temp = new Product();
				temp.setProductName(rs.getString("productName"));
				temp.setProductPrice(rs.getInt("productPrice"));
				temp.setStockCount(rs.getInt("stockCount"));
				list.add(temp);
			}
			rs.close();			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			disconnect();
		}
		return list;
	}
	
	
}
