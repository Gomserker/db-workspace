import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class BMIMain {
	public static void main(String[] args) throws SQLException {
		
		// pk(��ȣ), �̸�, ü��, Ű, bmi ����(�Ҽ��� 2�ڸ�������), ���ܰ��
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("�̸� : ");
		String name = input.next();
		System.out.print("ü�� : ");
		double weight = input.nextDouble();
		System.out.print("Ű : ");
		double height = input.nextDouble();
		
		if(height > 10) { 
			height /= 100; 
    }
		double bmi = weight / ((height) * (height));
		
		String result = "��";
		
		if (bmi < 20) {
			result = "��ü��";
		} else if (bmi < 25) {
			result = "����";
		} else if (bmi < 30) {
			result = "��ü��";
		}
		
		System.out.printf("bmi ��ġ: %.2f\n",bmi);
		System.out.printf("%s��, ����� %s�Դϴ�.\n", name, result);
		
		
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
