/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Access;
import java.sql.Date;
/**
 *
 * @author mfranco
 */
public class Courses {
    private int difficulty;
    private String language;
    private String name;
    private int id_course;
    private Date start_time;
    private Date end_time;
    private double total_grade;

    public Courses() {
        
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_course() {
        return id_course;
    }

    public void setId_course(int id_course) {
        this.id_course = id_course;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public double getTotal_grade() {
        return total_grade;
    }

    public void setTotal_grade(double total_grade) {
        this.total_grade = total_grade;
    }
    
}
