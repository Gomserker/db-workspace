import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBMain {
	public static void main(String[] args) throws SQLException {
		/*
		 connection�� �����⿡ �Ұ��ϴ�.
 		 build path�� ojdbc.jar�� ���̺귯���� �߰��ϴ� ��� �ܿ���
		 configure -> convert to maven project�� ����
		 pom.xml�̶�� ������ ������Ʈ ���� �߰��ȴ�.
		 mvnrepository���� ojdbc maven ��θ� ������ �ٿ��� ojdbc8.jar�� �ε��� �� �ִ�.
		 */
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
//		�ڹٿ��� CRUD �� - Create�� �غ��� -> resultSet�� �ʿ� ����. resultSet�� �ʿ��� ���� select�� �����͸� ��ȸ�Ҷ���.
//		executeQuery = select (c Read ud)
//		executeUpdate = ������ (C r UD)
		Statement st = con.createStatement();
		
		String sql = "insert into db_test values (db_test_seq.nextval, '�μ�', 23)";
		if(st.executeUpdate(sql) == 1) {
			System.out.println("new item updated");
		} else {
			System.out.println("update failed");
		}
		st.close();
		con.close();
	}
}
