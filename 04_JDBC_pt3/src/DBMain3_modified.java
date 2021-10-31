import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain3_modified {
	public static void main(String[] args) throws SQLException {
		
//		���� ���̺� ���� �ϳ� �ֱ�
		
		Scanner input = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
		System.out.print("�̸� : ");
		String name = input.next();
		System.out.print("������ : ");
		String maker = input.next();
		System.out.print("���� : ");
		double weight = input.nextDouble();
		System.out.print("���� : ");
		int price = input.nextInt();
		
		String sql = "insert into snack values (snack_seq.nextval, ?,?,?,?, sysdate)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, maker);
		pstmt.setDouble(3, weight);
		pstmt.setInt(4, price);
		
		System.out.println(sql);
		
		if(pstmt.executeUpdate(sql) == 1) {
			System.out.println("new item updated");
		} else {
			System.out.println("update failed");
		}
		
		pstmt.close();
		con.close();
	}
}
