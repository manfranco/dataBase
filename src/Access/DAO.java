package Access;

import java.sql.*;
import java.util.ArrayList;

public class DAO {
    // JDBC driver name and database URL

    static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private Connection conn = null;
    private Statement stmt = null;
    private CallableStatement stmt2 = null;
    //  Database credentials
    static final String USER = "system";
    static final String PASS = "admin";

    public DAO() {

        try {
            //STEP 2: Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        System.out.println("Goodbye!");
    }//end main

    public boolean login(String username, String password) {
        User user = new User();
        boolean in = false;
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{call CHECK_PASSWORD(?,?)}");
            stmt2.setString(1, username);
            stmt2.setString(2, password);
            stmt2.execute();
            in = stmt2.getBoolean(2);
            if (in) {
                System.out.println("Estamos dentro");
            } else{
                System.out.println("nope");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return in;
    }
    
    
    
    public ArrayList<Course> coursesAvailable(){
        ArrayList<Course> courses = new ArrayList();
                try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT id, first, last, age FROM Employees";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            Course course = new Course();
            while (rs.next()) {    
                course.setDifficulty(rs.getInt("DIFFICULTY"));
                course.setEnd_time(rs.getDate("END_TIME"));
                course.setId_course(rs.getInt("ID_COURSE"));
                course.setLanguage(rs.getString("LANGUAGE"));
                course.setName(rs.getString("NAME"));
                course.setStart_time(rs.getDate("START_TIME"));
                course.setTotal_grade(rs.getDouble("TOTAL_GRADE"));
                courses.add(course);
            }
            System.out.println("Cursos enviados");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return courses;
    } 
    
    
}
