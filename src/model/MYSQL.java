package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MYSQL {

    static Connection c;
    private static final String username = "root";
    private static final String db = "restaurant_db";
    private static final String password = "Gamage0212#1122";

    public static Statement createConnection() throws Exception {
        if (c == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db , username , password);
        }
        Statement s = c.createStatement();
        return s;

    }

    public static ResultSet search(String query) throws Exception {
        ResultSet rs = createConnection().executeQuery(query);
        return rs;
    }
    
    public static void iud(String query) {
        try {
            createConnection().executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}