package np.edu.nast.bca7th.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnector {
public static Connection connect() throws Exception{
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bca7thapp","root","");
	return con;
}
}
