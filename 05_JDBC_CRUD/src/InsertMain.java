import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {
	public static void main(String[] args) throws SQLException {
		Scanner input = new Scanner(System.in);
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db_test values(db_test_seq.nextval, ?, ?)";
		
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("���� ����");
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		
		System.out.print("name : ");
		String name = input.next();
		System.out.print("age : ");
		int age = input.nextInt();
		
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
//		SQL���� ������ �ڵ� �ۼ��ϴ� ���� ������ �ȵȴ�.
		
		int row = pstmt.executeUpdate();
		
		if(row == 1) {
			System.out.println("��� ����!");
		} else {
			System.out.println("��� ����");
		}
		
		pstmt.close();
		con.close();
	}
}
