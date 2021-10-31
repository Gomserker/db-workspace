import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DBMain2_modified {
	public static void main(String[] args) throws SQLException {
		
//		사람의 이름과 나이를 입력해서 db에 저장하기
		
		Scanner input = new Scanner(System.in);
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db_test values (db_test_seq.nextval, ?, ?)";

		Connection con = DriverManager.getConnection(url, "bg", "bg");
		System.out.println("connection complete with maven");
		
		System.out.print("이름 : ");
		String name = input.next();
		
		System.out.print("나이 : ");
		int age = input.nextInt();
		
//		이렇게 '" 따지면서 할거면 생지옥이 따로없음 쉽게하는법
//		Statement를 갖다 버린다. 불편하니까. st라고 되어있는 것 전부 삭제하는거 잊지말기
//		PreparedStatement 클래스를 사용한 후 
//		PreparedStatement 변수명 = Connection변수명.prepareStatement(sql문);
//		sql문을 PreparedStatement 문보다 위에 놓고 입력받을 컬럼에 ?를 넣는다.
		
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
