import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteMain {
	public static void main(String[] args) throws SQLException {
		
		Scanner input = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "delete from db_test where d_name = ?";
		String sql2 = "delete from db_test where d_no = ?";
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("연결 성공");
		
//		System.out.print("name : ");
//		String name = input.next();
		System.out.println("number :");
		int number = input.nextInt();
		
//		PreparedStatement pstmt = con.prepareStatement(sql);
//		pstmt.setString(1, name);
		
		PreparedStatement pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, number);
		
		int row = pstmt.executeUpdate();
		if(row == 1) {
			System.out.println("deleted");
		} else {
			System.out.println("delete failed");
		}
		
		pstmt.close();
		con.close();
	}
}
