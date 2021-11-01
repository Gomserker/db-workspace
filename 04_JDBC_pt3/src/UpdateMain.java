import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {
	public static void main(String[] args) throws SQLException {
		
		Scanner input = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "update db_test set d_age = ? where d_name = ?";
		
		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("연결 성공");
		
		System.out.println("나이를 수정 하고싶은 사람 이름");
		String name = input.next();
		// 몇 살로 수정할까요?
		System.out.println("몇 살로 수정할까요?");
		int age = input.nextInt();
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, age);
		pstmt.setString(2, name);
		
		if(pstmt.executeUpdate() >= 1) {
			System.out.println("수정 완료!");
		}
		
		
		pstmt.close();
		con.close();
	}
}
