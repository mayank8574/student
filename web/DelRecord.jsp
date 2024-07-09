<%@include file="header.jsp" %>
<%@page import="java.sql.*" %>
<%
    Connection con;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/db","root","");
    String rno=request.getParameter("rno");
    session.setAttribute("rno",rno);
    char gen=' ';
    String query="select * from data where rno='"+rno+"'";
    Statement st=con.createStatement();
    rs=st.executeQuery(query);
    if(rs.next())
    {
    
      session.setAttribute("name",rs.getString("name"));
      session.setAttribute("email",rs.getString("email")); 
      session.setAttribute("subject",rs.getString("subject")); 
      session.setAttribute("adhar",rs.getString("adhar")); 
      session.setAttribute("fname",rs.getString("fname")); 
      session.setAttribute("mname",rs.getString("mname")); 
      session.setAttribute("contact",rs.getString("contact")); 
      session.setAttribute("gender",rs.getString("gender")); 
      session.setAttribute("address",rs.getString("address")); 
   
    }
    gen=session.getAttribute("gender").toString().charAt(0);
    if(gen=='M')
      session.setAttribute("gender", "Male");
    else
      session.setAttribute("gender", "Female");
    
%>
<div class="container mt-3">
    <h1 align="center">Delete Student Form<br/>
        <img src="Profile/<%=rs.getString("profile")%>" alt="alt" class="circle1"/>
                </h1>
                
		
                
                <form action="DelRec"  method="post" name="form" >

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Name</label> 
						<input class="form-control" id="name" name="name" value="<%=(String)session.getAttribute("name")%>" readonly  />
						<div id="n" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="designation">Email-Id</label> 
						<input class="form-control" id="email" name="email" value="<%=(String)session.getAttribute("email")%>" readonly  />
						<div id="e" class="error"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="subject">Subject</label> 
							    <input type="text" class="form-control" id="suject" 
                                         name="subject"  value="<%=(String)session.getAttribute("subject")%>" readonly/>	
							<div id="s" class="error"></div>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="salary">Addhar No</label> 
						<input type="text" class="form-control" id="adhar" name="adhar" value="<%=(String)session.getAttribute("adhar")%>" readonly  />
						<div id="an" class="error"></div>	
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Father Name</label> 
						<input type="text" class="form-control"  name="fname" id="fname" value="<%=(String)session.getAttribute("fname")%>" readonly />
						<div id="fn" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="name">Mother Name</label> 
						<input type="text" class="form-control" id="mname" name="mname" value="<%=(String)session.getAttribute("mname")%>" readonly />
						<div id="mn" class="error"></div>
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="contact">Contact</label> 
						<input class="form-control" id="contact" name="contact" value="<%=(String)session.getAttribute("contact")%>" readonly />
						<div id="c" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="designation">Gender</label><br/> 
                                               <input type="text" class="form-control"id="gender" name="gender"  value="<%=(String)session.getAttribute("gender")%>" readonly />
                                                <div id="g" class="error"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="address">Address</label>
						<textarea class="form-control" id="address" name="address"
							rows="5" readonly/><%=(String)session.getAttribute("address")%></textarea>
						
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-danger">Delete</button>
						<a href="index.jsp"
							class="btn btn-warning"> Back </a>
					</div>
				</div>
			</div>
		</form>

	</div>

 <%@include file="footer.jsp"  %>
