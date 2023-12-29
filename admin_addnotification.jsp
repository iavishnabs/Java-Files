
<%@include file="connections.jsp"%>
<%@include file="admin_header.jsp"%>

    <%
//   String tid=session.getAttribute("staff_id").toString();
  if (request.getParameter("add")!=null)
  {
      
     String s = request.getParameter("title");
     String s2 = request.getParameter("description");
 
     String q1 = "insert into notification values(null,'"+s+"','"+s2+"')";
     st.executeUpdate(q1);
     
  %>  
<script>
    alert("Added successfully");
    window.location="admin_addnotification.jsp";
</script>

<%
  }
%>

<%
  String a = request.getParameter("update");
  if(a!= null)
{
    String s = request.getParameter("title");
     String s2 = request.getParameter("description");
     
   
   String uid=request.getParameter("uid");

   String q1 = "UPDATE notification SET `title`='"+s+"',description='"+s2+"' where not_id='"+uid+"'";
   st2.executeUpdate(q1);
 %>
   <script>
       alert("updated successfully");
       window.location="admin_addnotification.jsp";
   </script>
<%
}
%> 

  <%
  
  if(request.getParameter("did")!=null)
  {
      String did=request.getParameter("did");
      String q1 = "delete from notification where not_id='"+did+"'";
      st.executeUpdate(q1);     
%>
<script>
    alert("Deleted successfully");
    window.location="admin_addnotification.jsp";
</script>

<%
  }
 
%>

<% 
                
        String uid=request.getParameter("uid");
       rs1= st.executeQuery("select * from notification where not_id='"+uid+"'");
        if(rs1.next())
        {
                
                
         %>
                
      <h1>UPDATE NOTIFICATION</h1>
         <table>
    <form action="" method="post">
           <tr>
                <th>Title</th>
                <td><input type="text" name="title" value="<%=rs1.getString("title") %>"></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><input type="text" name="description" value="<%=rs1.getString("description") %>"></td>
            </tr>
            
            <tr>
                <td><input type="submit" name="update" value="UPDATE"></td>
            </tr>
    </form>
      </table>
      <% 
        }      
            else
        {            
%>

    <h1>ADD NOTIFICATION</h1>
     <table>
    <form action="" method="post">
<tr>
            <tr>
                <th>Title</th>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><input type="text" name="description"></td>
            </tr>
            
            <tr>
               
                <td><input type="submit" name="add" value="ADD"></td>

            </tr>
    </form>
      </table>

    
    <% 
        }
            
                    %>


    <h1 >view Notification</h1>
    <form method="post">
            <table class="table"  >
                <tr>
                    <td>Name<input type="text" name="sr"/><input type="submit" name="search" value="Search"/></td>
                </tr>
            </table>
            <table class="table"  border='1'>
                
  
            <tr>
                <th>Sl.No</th>
                <th>Title</th>
                <th>Description</th>
                
            </tr> 
  <%
         String qry="";
                int serialNumber = 1;
                if(request.getParameter("search")!= null)
{
     String s=request.getParameter("sr");
      qry="select * from notification where `title` like '%"+s+"%'";
}
 else{
                      qry="select * from notification";
                }
                 System.out.println(qry);
                 rs1=st1.executeQuery(qry);
                System.out.println(rs1);
                while(rs1.next())
                {
                %>
        <tr>
            <td><%=serialNumber%></td>

            <td><%=rs1.getString("title") %></td>
            <td><%=rs1.getString("description") %></td>
            
          
            <td><a class="btn btn-success" href="?uid=<%=rs1.getString("not_id")%>">Update</a></td>
            <td><a class="btn btn-danger" href="?did=<%=rs1.getString("not_id")%>">Delete</a></td>
            
        </tr>
        
 <% serialNumber++;}%>          
            </table> 
    </form>
</center>


