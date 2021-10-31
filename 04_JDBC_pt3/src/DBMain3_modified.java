import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain3_modified {
	public static void main(String[] args) throws SQLException {
		
//		과자 테이블에 과자 하나 넣기
		
		Scanner input = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
		System.out.print("이름 : ");
		String name = input.next();
		System.out.print("제조사 : ");
		String maker = input.next();
		System.out.print("무게 : ");
		double weight = input.nextDouble();
		System.out.print("가격 : ");
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
