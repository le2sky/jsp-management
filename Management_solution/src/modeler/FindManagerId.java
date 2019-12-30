package modeler;

import java.sql.ResultSet;

public class FindManagerId extends DataBaseModeler{  //로그인할때, 회원가입할때 id중복확인을 위해 일치하는 아이디 찾는 클래스
	private ManagerEntitiy manager;
	
	public ManagerEntitiy idFind(String id) {
		manager=new ManagerEntitiy();
		connect();
		try {
			String sql="select * from nike_account_tbl where id=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				manager.setId(rs.getString(1));
				manager.setPassword(rs.getString(2));
				manager.setName(rs.getString(3));
				manager.setAddress(rs.getString(4));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		
		return manager;
	}
}
