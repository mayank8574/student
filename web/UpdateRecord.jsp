<%@include file="header.jsp" %>
<%@page import="java.sql.*" %>
<%
    char gen=' ';
    Connection con;
    ResultSet rs;
    if(session.getAttribute("msg")==null)
    {
    
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/db","root","");
    String rno=request.getParameter("rno");
    session.setAttribute("rno",rno);
    
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
        session.setAttribute("profile",rs.getString("profile"));
        session.setAttribute("temp",rs.getString("email"));
        session.setAttribute("temp1",rs.getString("adhar"));
        session.setAttribute("msg","");
    
    }
}
    gen=session.getAttribute("gender").toString().charAt(0);
    if(gen=='M')
      session.setAttribute("gender", "Male");
    else
      session.setAttribute("gender", "Female");
   %>
<div class="container mt-3">
		<h1 align="center">Update Student Form<br/> 
                <img src="Profile/<%=(String)session.getAttribute("profile")%>" alt="alt" class="circle1"/></h1><br/>
                <h3 align="center" class="msg"><%=(String)session.getAttribute("msg")%></h3>
		
                <form action="UpdateRec" onsubmit="return validate();" method="post" enctype="multipart/form-data" name="form" >

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Name</label> 
						<input class="form-control" id="name" name="name" placeholder="Enter Name" value="<%=(String)session.getAttribute("name")%>" />
						<div id="n" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="designation">Email-Id</label> 
						<input class="form-control" id="email" name="email" placeholder="Enter Email-Id" value="<%=(String)session.getAttribute("email")%>"  />
						<div id="e" class="error"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="subject">Subject</label> 
						 <input type="text" class="form-control" id="suject" 
                                         name="subject"  value="<%=(String)session.getAttribute("subject")%>" />	    
							<div id="s" class="error"></div>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="salary">Addhar No</label> 
						<input type="text" class="form-control" id="adhar" name="adhar" placeholder="Enter Adhar Number" value="<%=(String)session.getAttribute("adhar")%>" />
						<div id="an" class="error"></div>	
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Father Name</label> 
						<input type="text" class="form-control"  name="fname" id="fname" placeholder="Enter Father Name" value="<%=(String)session.getAttribute("fname")%>" />
						<div id="fn" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="name">Mother Name</label> 
						<input type="text" class="form-control" id="mname" name="mname" placeholder="Enter Mother Name" value="<%=(String)session.getAttribute("mname")%>" />
						<div id="mn" class="error"></div>
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="contact">Contact</label> 
						<input class="form-control" id="contact" name="contact" placeholder="Enter Contact Number" value="<%=(String)session.getAttribute("contact")%>" />
						<div id="c" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="designation">Gender</label><br/> 
                                               <input type="text" class="form-control"id="gender" name="gender"  value="<%=(String)session.getAttribute("gender")%>"  />
                                                <div id="g" class="error"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="address">Address</label>
						<textarea class="form-control" id="address" name="address"
							rows="5" placeholder="Enter Address"/><%=(String)session.getAttribute("address")%></textarea>
						
					</div>
				</div>
                                 <div class="col">
					<div class="form-group">
						<label for="Profile"></label> 
                                                <input type="file" class="form-control"id="image"  name="image"  />
                                                <div id="p" class="error"></div>
						
					</div>
				</div>                        
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-group">
						<button type="submit" class="btn btn-primary">Update</button>
						<a href="index.jsp"
							class="btn btn-warning"> Back </a>
					</div>
				</div>
			</div>
		</form>

	</div>
<script>
   var n=/^[A-Za-z ]{3,30}$/; 
   var fname=/^[A-Za-z ]{3,30}$/;
   var mname=/^[A-Za-z ]{3,30}$/;
   var an=/^[0-9]{12}$/;
   var c=/^[0-9]{7,12}$/;
   var e=/^([a-zA-Z0-9\.])+\@(([a-zA-Z0-9])+\.)+([a-zA-Z0-9]{2,3})+$/;
   function validate()
   {
       var name=form.name.value;
       var email=form.email.value;
       var Fname=form.fname.value;
       var Mname=form.mname.value; 
       var contact=form.contact.value;
       var gender=form.gender.value;
       var adharno=form.adharno.value;
       var subject=form.subject.value;
       flag=1;
       if(!n.test(name))
       {
           document.getElementById("n").innerHTML="Enter a valid Name";
           if(flag==1)
           {
               form.name.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("n").innerHTML="";
       }
       if(!fname.test(Fname))
       {
           document.getElementById("fn").innerHTML="Enter  Father Name";
           if(flag==1)
           {
               form.fname.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("fn").innerHTML="";
       }
       if(!mname.test(Mname))
       {
           document.getElementById("mn").innerHTML="Enter  Mother Name";
           if(flag==1)
           {
               form.mname.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("mn").innerHTML="";
       }
       if(!e.test(email))
       {
           document.getElementById("e").innerHTML="Enter Email Id";
           if(flag==1)
           {
               form.email.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("e").innerHTML="";
       }
       if(!c.test(contact))
       {
           document.getElementById("c").innerHTML="Enter Contact Number";
           if(flag==1)
           {
               form.contact.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("c").innerHTML="";
       }
       if(!an.test(adharno))
       {
           document.getElementById("an").innerHTML="Enter Valid AdharNumber";
           if(flag==1)
           {
               form.adharno.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("an").innerHTML="";
       }
       if(subject=="")
       {
           document.getElementById("s").innerHTML="Enter Subject";
           if(flag==1)
           {
               form.subject.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("s").innerHTML="";
       }
       if(gender=="")
       {
           document.getElementById("g").innerHTML="Enter  Gender ";
           if(flag==1)
           {
               form.gender.focus;
           }
          flag=0;
       }
       else{
           document.getElementById("g").innerHTML="";
       }
       if(flag==1)
           return true;
       else
           return false;
       
       
       
       
   }
</script>
 <%@include file="footer.jsp"  %>
