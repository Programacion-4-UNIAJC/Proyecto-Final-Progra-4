/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

//Imports de imprimir datos
import java.io.IOException;
import java.io.PrintWriter;

//import java.beans.Statement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



/**
 *
 * @author estudiante101
 */
@WebServlet(name = "conexionbd", urlPatterns = {"/conexionbd"})
public class conexionbd extends HttpServlet {
    
    private java.sql.Connection conection = null;
    
   

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out;
        out = response.getWriter();
        
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet conexionbd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet conexionbd at " + request.getContextPath() + "</h1>");
            
        
        
          //Try-Catch
		try {
			
			Class.forName("org.gjt.mm.mysql.Driver");
			String 	url 		= "jdbc:mysql://localhost:3306/ie_la_inmaculada", 
					user 		= "root", 
					password 	= "";
			
			conection = java.sql.DriverManager.getConnection(url,user,password);
			Statement s = conection.createStatement();
			
                        out.println("<h3>Se ha realizado la conexión con éxito </h3>");
			//String sql = "INSERT INTO entradas VALUES (NULL,'"+request.getParameter("nombre")+"','"+request.getParameter("email")+"','"+request.getParameter("fecha")+"')"; //Insert SQL
			//s.executeUpdate(sql); //Ejecutar la consulta
			//out.println("El registro se ha guadado con �xito"); //Mensaje de �xito
			conection.close(); //Cerrar la conexion
			
		} catch (SQLException e) {//Imprimir errores en SQL
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Hay un error con la conexion");
		}
		catch (ClassNotFoundException e) {//Imprimir errores en el controller de la BD
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Hay un error con la clase");
		}
		
                
            out.println("</body>");
            out.println("</html>");
	}
		
	
            
        
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
