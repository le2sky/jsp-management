package modeler;

public class InsertManager extends DataBaseModeler {    //회원가입할때 기입한 정보를 DB로 넘겨주는 클래스
	public void insert(ManagerEntitiy manager) {
		connect();
		try {
			String sql="insert into nike_account_tbl values(?, ?, ?, ?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, manager.getId());
			pstmt.setString(2, manager.getPassword());
			pstmt.setString(3, manager.getName());
			pstmt.setString(4, manager.getAddress());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		
	}
}
