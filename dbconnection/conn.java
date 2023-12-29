/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class conn {
    Connection con=null;
    public Connection connect() 
    { 
        try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/seafarer_db","root","");
    }
        catch(Exception e)
        {
            System.out.println("Exception in connection"+e);
        }
    return con;
}
}




