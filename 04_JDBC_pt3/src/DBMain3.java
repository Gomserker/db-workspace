import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain3 {
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
