package Access;

import java.sql.*;
import java.util.ArrayList;

public class DAO {

    // JDBC driver name and database URL
    static User user = new User();
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

    public User getUser() {
        return user;
    }
    
    

    public User login(String username, String password) {
       
        int in = 0;
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{? = call CHECK_PASSWORD(?,?)}");
            stmt2.registerOutParameter(1, Types.INTEGER);
            stmt2.setString(2, username);
            stmt2.setString(3, password);
            stmt2.execute();
            in = stmt2.getInt(1);
            if (in != 0) {
                System.out.println("Estamos dentro");
                stmt = conn.createStatement();
                String sql;
                sql = "SELECT * FROM USUARIO WHERE ID_USER = " + in;
                
                ResultSet rs = stmt.executeQuery(sql);
                //STEP 5: Extract data from result set
                
                while (rs.next()) {
                    user.setEmail_user(rs.getString("EMAIL_USER"));
                    user.setIduser(rs.getInt("ID_USER"));
                    user.setName_user(rs.getString("NAME_USER"));
                    user.setPassword(rs.getString("PASSWORD"));
                    user.setUsername(rs.getString("USERNAME"));
                }
            } else {
                System.out.println("nope");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return user;
    }

    public User createUser(String username, String password, String name, String email) {
        User user = new User();
        int in = 0;
        int check = checkUser(username);
        if(check == 1){
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{? = call CREATE_USER(?,?,?,?)}");
            stmt2.registerOutParameter(1, Types.INTEGER);
            stmt2.setString(2, username);
            stmt2.setString(3, password);
            stmt2.setString(4, name);
            stmt2.setString(5, email);
            stmt2.execute();
            in = stmt2.getInt(1);
            if (in != 0) {
                System.out.println("Estamos dentro");
                stmt = conn.createStatement();
                String sql;
                sql = "SELECT * FROM USUARIO WHERE ID_USER = " + in;
                
                ResultSet rs = stmt.executeQuery(sql);
                //STEP 5: Extract data from result set
                
                while (rs.next()) {
                    user.setEmail_user(rs.getString("EMAIL_USER"));
                    user.setIduser(rs.getInt("ID_USER"));
                    user.setName_user(rs.getString("NAME_USER"));
                    user.setPassword(rs.getString("PASSWORD"));
                    user.setUsername(rs.getString("USERNAME"));
                }
            } else {
                System.out.println("nope");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return user;
        }
        System.out.println("El usuario ya existe");
        return null;
    }
        
        public User editUser(String username, String password, String name, String email) {
        
        int in = 0;
        int check = checkUser(username);
        if(check == 1){
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{? = call EDIT_USER(?,?,?,?,?)}");
            stmt2.registerOutParameter(1, Types.INTEGER);
            stmt2.setInt(2, user.getIduser());
            stmt2.setString(3, username);
            stmt2.setString(4, password);
            stmt2.setString(5, name);
            stmt2.setString(6, email);
            stmt2.execute();
            in = stmt2.getInt(1);
            if (in != 0) {
                System.out.println("Estamos dentro");
                stmt = conn.createStatement();
                String sql;
                sql = "SELECT * FROM USUARIO WHERE ID_USER = " + in;
                
                ResultSet rs = stmt.executeQuery(sql);
                //STEP 5: Extract data from result set
                
                while (rs.next()) {
                    user.setEmail_user(rs.getString("EMAIL_USER"));
                    user.setIduser(rs.getInt("ID_USER"));
                    user.setName_user(rs.getString("NAME_USER"));
                    user.setPassword(rs.getString("PASSWORD"));
                    user.setUsername(rs.getString("USERNAME"));
                }
            } else {
                System.out.println("nope");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return user;
        }
        System.out.println("El usuario ya existe");
        return null;
    }
    
        public void checkAccess(String type, int courseId, int inputId) {
        User user = new User();
        int in = 0;
        
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{call CHECK_ACCESS(?,?,?)}");
            
            stmt2.setString(3, type);
            stmt2.setInt(1, courseId);
            stmt2.setInt(2, inputId);
            
            stmt2.execute();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }
    
    private int checkUser(String username) {
        
        int in = 0;
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{? = call CHECK_USER(?)}");
            stmt2.registerOutParameter(1, Types.INTEGER);
            stmt2.setString(2, username);
            stmt2.execute();
            in = stmt2.getInt(1);
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return in;
    }
    public void RegisterCourse(int courseId, int userId) {
        User user = new User();
        int in = 0;
        
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt2 = conn.prepareCall("{call REGISTER_COURSE(?,?)}");
             
            stmt2.setInt(2, courseId);
            stmt2.setInt(1, userId);
            stmt2.execute();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
    }

    
    public ArrayList<Courses> coursesAvailable() {
        ArrayList<Courses> courses = new ArrayList();
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM COURSE";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while (rs.next()) {
                Courses course = new Courses();
                course.setDifficulty(rs.getInt("DIFFICULTY"));
                course.setEnd_time(rs.getDate("END_TIME"));
                course.setId_course(rs.getInt("ID_COURSE"));
                course.setLanguage(rs.getString("LANGUAGE"));
                course.setName(rs.getString("NAME"));
                course.setStart_time(rs.getDate("START_TIME"));
                //course.setTotal_grade(rs.getDouble("TOTAL_GRADE"));
                courses.add(course);
            }
            System.out.println("Cursos enviados");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return courses;
    }

}
