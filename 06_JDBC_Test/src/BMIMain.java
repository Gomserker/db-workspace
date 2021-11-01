import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class BMIMain {
	public static void main(String[] args) throws SQLException {
		
		// pk(번호), 이름, 체중, 키, bmi 지수(소수점 2자리까지만), 진단결과
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("이름 : ");
		String name = input.next();
		System.out.print("체중 : ");
		double weight = input.nextDouble();
		System.out.print("키 : ");
		double height = input.nextDouble();
		
		if(height > 10) { 
			height /= 100; 
    }
		double bmi = weight / ((height) * (height));
		
		String result = "비만";
		
		if (bmi < 20) {
			result = "저체중";
		} else if (bmi < 25) {
			result = "정상";
		} else if (bmi < 30) {
			result = "과체중";
		}
		
		System.out.printf("bmi 수치: %.2f\n",bmi);
		System.out.printf("%s님, 당신은 %s입니다.\n", name, result);
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "bg";
		String pw = "bg";
		
		Connection con = DriverManager.getConnection(url, id, pw);
		System.out.println("connected!");
		
		String sql = "insert into db_bmi values (db_bmi_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setDouble(2, weight);
		pstmt.setDouble(3, height);
		pstmt.setDouble(4, bmi);
		pstmt.setString(5, result);
		
		int row = pstmt.executeUpdate();
		
		if(row == 1) {
			System.out.println("item listed");
		}
		
		pstmt.close();
		con.close();
	}
}
