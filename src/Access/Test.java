/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Access;

/**
 *
 * @author Miguel Morales
 */
public class Test {
    public static void main(String[] args) {
        DAO dao = new DAO();
        boolean test = dao.login("mmoral27", "111");
        System.out.println(test);
    }
}
