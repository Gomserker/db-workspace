import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMain {
	public static void main(String[] args) throws SQLException {
		
//		DB �����ϱ�
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		
//		����õ� -> �ּ� -> ������ db ����Ŀ(oracle, mysql ��) �Ǵ�
//		�ڵ����� �´� driver�� ã���ش�.
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("���� ����");
		
		
		con.close();
		
	}
}
