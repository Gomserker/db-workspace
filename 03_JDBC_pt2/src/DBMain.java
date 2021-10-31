import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMain {
	public static void main(String[] args) throws SQLException {
		//DB ���� �۾��� �Ϸ���
//		������ 3���� �ݵ�� ����Ұ�
//		connection, statement, resultSet
//		�� �ϵ� CRUD, DB�� �����ϴ� ���� 1����
		
//		1.����
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "bg";
		String pw = "bg";
				
		Connection con = DriverManager.getConnection(url, id, pw);
//		������Ʈ�� ���� ���鶧���� ojdbc�� �����н��� �־����� Ȯ���Ұ�. connection�� �ϴ°� ���� ��ü!
		System.out.println("connection complete");
		
//		���� ���� ����� -> executeQuery ���� ������ �� ���°�
		Statement st = con.createStatement();
		
		String query = "select * from db_test";
		ResultSet rs = st.executeQuery(query);
		
//		���̺� �󿡼� Ŀ�� �̵�, �׷��� ��ü��ȸ�� �����? -> �ݺ����� ���!
		while(rs.next()) {
			System.out.println(rs.getString("d_name"));
			System.out.println(rs.getInt("d_age"));
			System.out.println("---------------------------");
		}
		rs.close();
		st.close();
		con.close();
	}
}
