import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test {
	public static void main(String[] args) throws SQLException {
		
//	스낵 테이블에 있는거 전부 출력
		String url2 = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "bg";
		String pw = "bg";
		Connection con = DriverManager.getConnection(url2, id, pw);
		
		Statement st = con.createStatement();
		
		String sql = "select * from snack";
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString("snack_name"));
			System.out.println(rs.getString("snack_maker"));
			System.out.println(rs.getInt("snack_weight"));
			System.out.println(rs.getInt("snack_price"));
			System.out.println(rs.getString("snack_expire"));
			System.out.println("----------------");
		}
		
		rs.close();
		st.close();
		con.close();
		
	}
}
