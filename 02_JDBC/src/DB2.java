import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB2 {
	public static void main(String[] args) throws SQLException {
		
//		������ con, st, rs
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		//����
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		
		//���൵��
		Statement st = con.createStatement();
		
		//��� ��� ������.executeQuery("����ϰ� ���� sql ��ɾ�");
		String sql = "select * from db_test";
		ResultSet rs = st.executeQuery(sql);
		
		rs.next();
		rs.next();
		String name = rs.getString("d_name");
		System.out.println(name);
		
		int age = rs.getInt("d_age");
		System.out.println(age);
	}
}
