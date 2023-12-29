<%-- 
    Document   : login
    Created on : May 15, 2023, 1:17:21 PM
    Author     : Riss
--%>

<%@include file="connections.jsp"%>

<%
if(request.getParameter("login")!=null)
{
   String us=request.getParameter("uname");
   String pwd=request.getParameter("pwd");

   rs=st.executeQuery("select * from login where username='"+us+"' and password='"+pwd+"'");
   if(rs.next())
   {
       String lid=rs.getString("login_id");
       session.setAttribute("lognid",lid);
       String utype=rs.getString("type");
       

       if(utype.equals("admin"))
       { 
                   
       %>  
       <script>
           alert("login successfully");
           window.location="admin_home.jsp";
       </script>
       <%

       }
       
       else if(utype.equals("manager"))
       {
           rs = st.executeQuery("select * from staff where login_id='"+lid+"'");
           if (rs.next())
           {
               String mid=rs.getString("staff_id");
               session.setAttribute("staff_id",mid);
               
           }
            %>  
       <script>
           alert("login successfully");
           window.location="manager_home.jsp";
       </script>
       <%
       }
    else if(utype.equals("voyager"))
       {
           rs = st.executeQuery("select * from voyager where login_id='"+lid+"'");
           if (rs.next())
           {
               String vid=rs.getString("voyager_id");
               session.setAttribute("voyager_id",vid);
               
           }
            %>  
       <script>
           alert("login successfully");
           window.location="voyager_home.jsp";
       </script>
       <%
       }
        else if(utype.equals("superviser"))
       {
           rs = st.executeQuery("select * from staff where login_id='"+lid+"'");
           if (rs.next())
           {
               String sid=rs.getString("staff_id");
               session.setAttribute("staff_id",sid);
               
           }
            %>  
       <script>
           alert("login successfully");
           window.location="superviser_home.jsp";
       </script>
       <%
       }

    
}
   else{
   
   %>  
       <script>
           alert("login failed");
           window.location="login.jsp";
       </script>
       <%

   
   }
}
%>
   

   <!-- ***** Features Big Item Start ***** -->
    <section class="section" id="promotion">
        <div class="container">
            <div class="row">
                <div class="left-image col-lg-5 col-md-12 col-sm-12 mobile-bottom-fix-big"
                    data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
                    <img src="assets/images/b.png" class="rounded img-fluid d-block mx-auto" alt="App">
                </div>
                <div class="right-text offset-lg-1 col-lg-6 col-md-12 col-sm-12 mobile-bottom-fix">
                    <ul>
                        <li data-scroll-reveal="enter right move 30px over 0.6s after 0.4s">
                                
                           

<form method="post" style="margin-top: 100px">
   
	<center>
		<h1>LOGIN</h1>
		<table class="table" style="width: 500px">
			<tr>
				<th>username</th>
				<td><input type="text" name="uname" required="" class="form-control"></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="password" name="pwd" required="" class="form-control"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
                                    <input type="submit" name="login" value="LOGIN" class="btn btn-success"></td>
			</tr>
		</table>
	</center>
</form>

 </div>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Features Big Item End ***** -->



