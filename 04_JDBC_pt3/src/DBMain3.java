import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain3 {
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
		
		Statement st = con.createStatement();
		
		/*
		snack_num number(30) primary key,
		snack_name varchar2(50 char) not null,
		snack_maker varchar2(50 char) not null,
		snack_weight number(5,1) not null,
		snack_price number(5) not null,
		snack_expire date not null
			 */
		
		String sql = "insert into snack values (snack_seq.nextval, '" + name + "', '" + maker + "', " + weight + ", "+ price +", sysdate )";
		System.out.println(sql);
		if(st.executeUpdate(sql) == 1) {
			System.out.println("new item updated");
		} else {
			System.out.println("update failed");
		}
		
		st.close();
		con.close();
	}
}
