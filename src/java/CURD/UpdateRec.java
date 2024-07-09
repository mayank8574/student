/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package CURD;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author mayan
 */
@MultipartConfig
@WebServlet(name = "UpdateRec", urlPatterns = {"/UpdateRec"})
public class UpdateRec extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateRec</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRec at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String subject =request.getParameter("subject"); 
        String adhar=request.getParameter("adhar");
        String fname =request.getParameter("fname");
        String mname=request.getParameter("mname");
        String contact=request.getParameter("contact");
        String gender=request.getParameter("gender");
        String address=request.getParameter("address");
        
        HttpSession session=request.getSession();
        String temp_e=(String)session.getAttribute("temp");
        String temp_b=(String)session.getAttribute("temp1");
        String rno=(String)session.getAttribute("rno");
        
        Part file=request.getPart("image");
        String filename=file.getSubmittedFileName();
        String ext=file.getContentType();
        out.print(ext+"\n"+"Filename"+filename+"\n");
        boolean flag=true;
        if(filename.length()>0)
        {
            if(ext.equals("image/jpeg") || ext.equals("image/png"))
            {
                String path="F:/Progrms/JSP/StudentProject/web/Profile/"+filename;
                try
                {
                    FileOutputStream fos=new FileOutputStream(path);
                    InputStream is=file.getInputStream();
                    byte[] data=new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                }
                catch(Exception e){}
            }  
            else
            {
                flag=false;
                session.setAttribute("msg", "Please upload a Image File");
            }
        }
        else
            filename=(String)session.getAttribute("profile");
        
        
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        
        
        String query;
       //out.print(temp_e);
        //out.print("name :"+name+"email :"+email+"contact :"+contact+"salary :"+salary+"address :"+address+"gender :"+gender+"department :"+department);
        try{

            Class.forName("com.mysql.jdbc.Driver");
            
            con=DriverManager.getConnection("jdbc:mysql://localhost/db","root","");
        
           // out.print("name :"+name+"\ntemp_e :"+temp_e+"\nEmail : "+email);
            
            if(temp_e.equals(email)==false)
            {
                 query="select rno from data where email='"+email+"'";
                 out.print("name :"+query);
                 ps=con.prepareStatement(query);
                 rs=ps.executeQuery();
                 if(rs.next())
                 {
                     flag=false;

                      session.setAttribute("msg","Email-id already regestered");
                 }
            }
            else if(temp_b.equals(adhar)==false)
            {
                 query="select rno from data where adhar='"+adhar+"'";
                 out.print("name :"+query);
                 ps=con.prepareStatement(query);
                 rs=ps.executeQuery();
                 if(rs.next())
                 {
                     flag=false;

                      session.setAttribute("msg","Adhar Number already regestered");
                 }
            
            }
            //out.print("hi");    
            if(flag)
            {
                
                ps=con.prepareStatement("update data set name=?,email=?,subject=?,adhar=?,fname=?,mname=?,contact=?,gender=?,address=?,profile=? where rno= ?");
                ps.setString(1,name);
                ps.setString(2,email);
                ps.setString(3,subject);
                ps.setString(4,adhar);
                ps.setString(5,fname);
                ps.setString(6,mname); 
                 //out.print(adhar);
                ps.setString(7,contact); 
                ps.setString(8,gender);
                ps.setString(9,address);
                ps.setString(10,filename);
                ps.setString(11,rno);
                ps.executeUpdate();
                response.sendRedirect("index.jsp");
                
            }
            else
            {
            session.setAttribute("name",name);
             session.setAttribute("email",email);
             session.setAttribute("subject",subject);
             session.setAttribute("adhar",adhar);
             session.setAttribute("fname",fname);
             session.setAttribute("mname",mname);
             session.setAttribute("contact",contact);
             session.setAttribute("gender",gender); 
             session.setAttribute("address",address); 
             response.sendRedirect("UpdateRecord.jsp");
            }
            
            
        }
        catch(Exception e)
        {}
        
        
        
        
        
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
