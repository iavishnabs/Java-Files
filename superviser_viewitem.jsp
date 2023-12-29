<%@include file="connections.jsp"%>
<%@include file="superviser_header.jsp"%>

 <%
  String a = request.getParameter("update");
  if(a!= null)
{
     String s=request.getParameter("ordermain_id");
     String s2 = request.getParameter("order_st");
   
   String oid=request.getParameter("ordermain_id");

   String q1 = "UPDATE ordermain SET `status`='"+s2+"' where ordermain_id='"+oid+"'";
   st2.executeUpdate(q1);
 %>
   <script>
       alert("updated successfully");
       window.location="superviser_viewitem.jsp";
   </script>
<%
}
%> 

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <h1 >View Booked Item</h1>
    <form method="post">
            <table class="table"  >
                <tr>
                    <td>Name<input type="text" name="sr"/>
                        <input type="submit" name="search" value="Search"/></td>
                </tr>
            </table>
            <table class="table table-bordered"  border='1'>
                
  
            <tr>
                <th>Sl.No</th>
                <th>Voyager Name</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
           
              
               
            </tr>
              <%
         String qry="";
                int serialNumber = 1;
                if(request.getParameter("search")!= null)
                        {
                             String s=request.getParameter("sr");
                              qry="select * from items where item_name like '%"+s+"%'";


                        }
 else{
            qry="SELECT v_name,amount,quantity,item_name,`date`,`Time`,`status`,i_id,voyager_id,ordermain_id FROM ordermain innner JOIN ordersub USING(ordermain_id) INNER JOIN items ON(ordersub.item_id=items.i_id) INNER JOIN voyager USING(voyager_id) WHERE `type`='item'";
       
                }
                 System.out.println(qry);
                 rs1=st1.executeQuery(qry);
                System.out.println(rs1);
                while(rs1.next())
                {
                %>  
            
            
 
        <tr>
            <td><%=serialNumber%></td>  

            <td><%=rs1.getString("v_name") %></td>
            <td><%=rs1.getString("item_name") %> </td>
            <td><%=rs1.getString("quantity") %></td>
            <td><%=rs1.getString("amount") %></td>
            <td><%=rs1.getString("date") %></td>
             <td><%=rs1.getString("Time") %></td>
              <td><%=rs1.getString("status") %></td>
            
          
            
            
            <% if ("paid".equals(rs1.getString("status"))) { %>
        
        <% } else { %>
            <td><a class="btn btn-success" href="?ordermain_id=<%=rs1.getString("ordermain_id")%>">Update</a></td>
        <% } %>
        </tr>
            
        </tr>
        
 <% serialNumber++;}%>        
            </table> 
    </form>
        </div>
    </div>
</div>
            
            
            <% 
                
        String oid=request.getParameter("ordermain_id");
       rs1= st.executeQuery("SELECT *,ordermain.status AS orderstatus FROM ordermain INNER JOIN ordersub WHERE ordersub.`type`='item' AND ordermain.ordermain_id='"+oid+"'");
        if(rs1.next())
        {
                
                
                %>

<h1>UPDATE STATUS</h1>
         <table>
    <form action="" method="post">
           
         <tr>
                <th>Order_id</th>
                <td><input type="number" name="order_id" value="<%=rs1.getString("ordermain_id")%>" readonly></td>
            </tr>
        
            <tr>
                <th>Price</th>
                <td><input type="text" name="order_st" value="<%=rs1.getString("orderstatus") %>"></td>
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




 <% 
        }
            
                    %>


<%@include file="admin_footer.jsp"%>