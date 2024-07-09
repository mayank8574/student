<%
  char gen=' ';
  if(session.getAttribute("msg")==null)
  {
     session.setAttribute("msg","");
     session.setAttribute("name",""); 
     session.setAttribute("email","");
     session.setAttribute("subject","Select Subject");
     session.setAttribute("adhar",""); 
     session.setAttribute("fname",""); 
     session.setAttribute("mname",""); 
     session.setAttribute("contact","");
     session.setAttribute("gender","");
     session.setAttribute("address","");
}  
 else
    gen=session.getAttribute("gender").toString().charAt(0);   
    
 %>
<%@include file="header.jsp" %>
<div class="container mt-3">
		<h1>Add Student Form</h1> 
                <h3><%=(String)session.getAttribute("msg")%></h3>
                <form action="AddRec" onsubmit="return validate();" method="post" enctype="multipart/form-data" name="form" >

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="name">Name</label> 
                                                <input class="form-control" id="name" name="name" placeholder="Enter Name" value="<%=(String)session.getAttribute("name")%>"  />
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
							    <select id="subject" name="subject" class="form-control">
							    	<option value="<%=(String)session.getAttribute("subject")%>" label="<%=(String)session.getAttribute("subject")%>"></option>
							        <option value="Math" label="Math"></option>
							        <option value="Commerce" label="Commerce"></option>
							        <option value="Art" label="Art"></option>
							    </select>
							<div id="s" class="error"></div>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="salary">Addhar No</label> 
						<input type="text" class="form-control" id="adhar" name="adhar" placeholder="Enter Adhar Number" value="<%=(String)session.getAttribute("adhar")%>"  />
						<div id="an" class="error"></div>	
					</div>
				</div>
			</div>
                    <div class="row">
				<div class="col">
					<div class="form-group">
						<label for="fname">Father Name</label> 
						<input type="text" class="form-control"  name="fname" id="fname" placeholder="Enter Father Name" value="<%=(String)session.getAttribute("fname")%>" />
						<div id="fn" class="error"></div>
						
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label for="mname">Mother Name</label> 
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
                                                <input type="radio" id="gender" name="gender" value="M" <%if (gen=='M'){ %>checked<%}%>/>&nbsp;&nbsp;&nbsp;Male&nbsp;&nbsp;&nbsp;
						<input type="radio" id="gender" name="gender" value="F" <%if (gen=='F'){ %>checked<%}%>/>&nbsp;&nbsp;&nbsp;Female
                                                <div id="g" class="error"></div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="form-group">
						<label for="address">Address</label>
						<textarea class="form-control" id="address" name="address"
							rows="5" placeholder="Enter Address"
                                                        /><%=(String)session.getAttribute("address")%></textarea>
						
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
						<button type="submit" class="btn btn-primary">Submit</button>
						<a href="index.jsp"
							class="btn btn-warning"> Back </a>
					</div>
				</div>
			</div>
		</form>

	</div>
 <%@include file="footer.jsp"  %>
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
       var Fn=form.fname.value;
       var Mn=form.mname.value; 
       var contact=form.contact.value;
       var gender=form.gender.value;
       var adharno=form.adhar.value;
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
       if(!fname.test(Fn))
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
       if(!mname.test(Mn))
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
       if(subject=="Select Subject")
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

 
 <%
    session.setAttribute("msg",null);
%>
