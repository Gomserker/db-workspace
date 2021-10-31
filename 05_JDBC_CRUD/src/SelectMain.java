import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {
	public static void main(String[] args) throws SQLException {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("���� ����");
		
		String sql = "select * from db_test";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
//		ResultSet�� select�� ����Ҷ��� ����
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			System.out.println(rs.getString("d_name"));
			System.out.println(rs.getInt("d_age"));
			System.out.println("----------------");
		}
		
		rs.close();
		pstmt.close();
		con.close();
	}
}
