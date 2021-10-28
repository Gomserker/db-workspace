import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
//	1. ����̹� �ε��ϱ� -> �� �ּ�ó���ϴµ� ������ ����? -> �������� �Ǹ鼭 Connection�� ����̹��� �˾Ƽ� �߰��� �ش�. -> �ᱹ �����ص� ��. -> �ٵ� �� ��?
//		-> Connection�� �� �������� ����. �׷��� �� ���Ѵ�� �ϴµ� �� �׳� �����ϴ�.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
//	2. ���� ��ü ���
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "bg", "bg");
//		System.out.println("Connection Compelete");
		
//	3. ���� ���� ����
		Statement st = con.createStatement();
		
//	4. ����� ���
		String sql = "select * from db_test";
		ResultSet rs = st.executeQuery(sql);
//		db_test ���̺� ��ü�� rs�� �� ����.
		
		if(rs.next()) {
			String name = rs.getString("d_name");
			System.out.println(name);
			
			int age = rs.getInt("d_age");
			System.out.println(age);
		}
		
//		java�� db�� �����Ҷ� �ݵ�� close() �޼ҵ�� �ݾ�����Ѵ�.
//		�� �ݵ�� ������ ����� �������� �ݾ�����Ѵ�.
		rs.close();
		st.close();
		con.close();
		
	}
}
