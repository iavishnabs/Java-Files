<%@include file="connections.jsp"%>
<%@include file="admin_header.jsp"%> 

    <h1 >view Items</h1>
    <form method="post">
            <table class="table"  >
                <tr>
                    <td>Name<input type="text" name="sr"/>
                        <input type="submit" name="search" value="Search"/></td>
                </tr>
            </table>
            <table class="table"  border='1'>
                
  
            <tr>
                <th>Sl.No</th>
                <th>Item</th>
                <th>Price</th>
               
            </tr>  
            <%
                int num = 1;
                String q="select * from menu";
                rs1=st1.executeQuery(q);
                while(rs1.next())      
                {
                %>
        <tr>
            <td><%=num%></td>  

            <td><%=rs1.getString("menus") %></td>
            <td><%=rs1.getString("price") %></td>
          
            <td><a class="btn btn-success" href="?uid=<%=rs1.getString("menu_id")%>">Update</a></td>
            <td><a class="btn btn-danger" href="?did=<%=rs1.getString("menu_id")%>">Delete</a></td>
            
        </tr>
        
 <% num++;
  }
 %>        
            </table> 
    </form>
