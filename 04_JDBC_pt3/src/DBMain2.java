import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain2 {
	public static void main(String[] args) throws SQLException {
		
//		����� �̸��� ���̸� �Է��ؼ� db�� �����ϱ�
		
		Scanner input = new Scanner(System.in);
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
		System.out.print("�̸� : ");
		String name = input.next();
		
		System.out.print("���� : ");
		int age = input.nextInt();
		
		Statement st = con.createStatement();
		
		String sql = "insert into db_test values (db_test_seq.nextval, '" + name + "', " + age + ")";
		if(st.executeUpdate(sql) == 1) {
			System.out.println("new item updated");
		} else {
			System.out.println("update failed");
		}
		
		st.close();
		con.close();
	}
}
