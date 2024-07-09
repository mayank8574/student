<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<div class="container mt-3">
		<h1>Add Student Form</h1>
		<a href="AddRecord.jsp" class="btn btn-primary"> Add Student </a>
		<div class="row">

			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">Rno</th>
                                                <th scope="col">Profile</th>
						<th scope="col">Name</th>
						<th scope="col">Father Name</th>
						<th scope="col"> Email id</th>
						<th scope="col">Gender</th>
                                                <th scope="col">Contact</th>
						<th scope="col">Addhar No</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
                                    <%
                                       Connection con;
                                       ResultSet rs;
                                       Class.forName("com.mysql.jdbc.Driver");
                                       con=DriverManager.getConnection("jdbc:mysql://localhost/db","root",""); 
                                       String query="select *from data";
                                       Statement st=con.createStatement();
                                       rs=st.executeQuery(query);
                                       int i=0;
                                       while(rs.next())
                                       {
                                       i++;
                                       String rno=rs.getString("rno");
                                    
                                        
                                        
                                      %>
					
						<tr>
							<td class="table-plus"><%=rno%></td>
                                                         <td><img src="Profile/<%=rs.getString("profile")%>" alt="alt" class="circle"/> </td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("fname")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("gender")%></td>
                                                        <td><%=rs.getString("contact")%></td>
							<td><%=rs.getString("adhar")%></td>
							<td><a href="UpdateRecord.jsp?rno=<%=rno%>" class="btn btn-warning">
									Edit </a></td>
							<td><a href="DelRecord.jsp?rno=<%=rno%>"
								class="btn btn-danger"> Delete </a></td>
						</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>
<%@include file="footer.jsp" %>