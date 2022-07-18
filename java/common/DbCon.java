package common;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbCon {
	private static DataSource _ds = null;
	public static Connection getConnection() throws Exception {
		if(_ds == null)
			_ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/mysql");
		return _ds.getConnection();
	}
	
	
}
