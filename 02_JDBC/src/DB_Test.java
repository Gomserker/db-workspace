import java.sql.*;

public class DB_Test {

	public static void main(String[] args) throws SQLException {
		//������ con, st, rs
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select*from db_test";
		//����
		Connection con = DriverManager.getConnection(url, "bg", "bg");
System.out.println("����");
	}
}