import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain2_modified {
	public static void main(String[] args) throws SQLException {
		
//		����� �̸��� ���̸� �Է��ؼ� db�� �����ϱ�
		
		Scanner input = new Scanner(System.in);
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db_test values (db_test_seq.nextval, ?, ?)";

		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
		System.out.print("�̸� : ");
		String name = input.next();
		
		System.out.print("���� : ");
		int age = input.nextInt();
		
//		�̷��� '" �����鼭 �ҰŸ� �������� ���ξ��� �����ϴ¹�
//		Statement�� ���� ������. �����ϴϱ�. st��� �Ǿ��ִ� �� ���� �����ϴ°� ��������
//		PreparedStatement Ŭ������ ����� �� 
//		PreparedStatement ������ = Connection������.prepareStatement(sql��);
//		sql���� PreparedStatement ������ ���� ���� �Է¹��� �÷��� ?�� �ִ´�.
		
		PreparedStatement pre_st = con.prepareStatement(sql);
		pre_st.setString(1, name);
		pre_st.setInt(2, age);

		if(pre_st.executeUpdate() == 1) {
			System.out.println("new item updated");
		} else {
			System.out.println("update failed");
		}
		
		pre_st.close();
		con.close();
	}
}
