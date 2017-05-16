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
public class Classes {
    private int idclass;
    private String name;
    private Date date;

    public Classes() {
        idclass = 0;
        name = null;
        date = null;
    }

    public int getId_class() {
        return idclass;
    }

    public void setId_class(int id_class) {
        this.idclass = id_class;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
