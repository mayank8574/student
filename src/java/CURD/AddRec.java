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
@WebServlet(name = "AddRec", urlPatterns = {"/AddRec"})
public class AddRec extends HttpServlet {

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
            out.println("<title>Servlet AddRec</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRec at " + request.getContextPath() + "</h1>");
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
       String subject=request.getParameter("subject");
       String adhar=request.getParameter("adhar");
       String  fname=request.getParameter("fname");
       String mname=request.getParameter("mname"); 
       String contact=request.getParameter("contact"); 
       String gender=request.getParameter("gender");
       String address=request.getParameter("address");
       HttpSession session=request.getSession();
       out.print("hi");
       boolean flag=true;
       Part file=request.getPart("image");
       String filename=file.getSubmittedFileName();
       String ext=file.getContentType();
       out.print(ext+"\n"+"Filename"+filename+"\n");
        
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
        else if(gender.equals("M"))
            filename="male.jpg";
        else
            filename="female.jpg";
      
      
       Connection con;
       PreparedStatement ps;
       ResultSet rs;
       String query;
       //out.print("name"+name);
     try{
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost/db","root","");
          query="select rno from data where email='"+email+"' ";
          ps=con.prepareStatement(query);
          rs=ps.executeQuery();
          if(rs.next())
          {
              flag=false;
              session.setAttribute("msg","Email-id already regestered" );
          }
          query="select rno from data where adhar='"+adhar+"'";
          ps=con.prepareStatement(query);
          rs=ps.executeQuery();
          if(rs.next())
          {
              flag=false;
              session.setAttribute("msg","Adhar Number already regestered");
          }
          
          if(flag)
          {
          ps=con.prepareStatement("insert into data (name,email,subject,adhar,fname,mname,contact,gender,address,profile) values(?,?,?,?,?,?,?,?,?,?)");
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
          ps.executeUpdate();
          session.setAttribute("name","");
          session.setAttribute("email","");
          session.setAttribute("subject","Select Subject");
          session.setAttribute("adhar"," ");          
          session.setAttribute("fname","");
          session.setAttribute("mname","");
          session.setAttribute("contact"," ");
          session.setAttribute("gender"," "); 
          session.setAttribute("address"," ");
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
             response.sendRedirect("AddRecord.jsp");
            }
        
     }
     catch(Exception e){}
     
      
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
