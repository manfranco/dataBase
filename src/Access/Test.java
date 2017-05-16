/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Access;

import java.util.ArrayList;

/**
 *
 * @author Miguel Morales
 */
public class Test {
    public static void main(String[] args) {
        DAO dao = new DAO();
        dao.RegisterCourse(1, 5);
        System.out.println("Ready");
    }
}
