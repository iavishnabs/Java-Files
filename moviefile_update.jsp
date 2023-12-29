<%-- 
    Document   : admin_manage_product
    Created on : Aug 26, 2022, 12:22:40 PM
    Author     : Riss
--%>

<%@ include file='admin_header.jsp'%>
<%@include file="connections.jsp" %>


<%@page import="java.io.FileOutputStream"%>

<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>



<%
    ServletFileUpload upload=new ServletFileUpload();
    FileItemIterator iter=null;
    String movie_name = "";
            String duration = "";
            String fare ="";
            String seats="";
            String date="";
            String uid="";
    String file=""; 
            
    

    iter=upload.getItemIterator(request);
    while(iter.hasNext()){
        FileItemStream item=iter.next();
        String nam=item.getFieldName();
        InputStream stream=item.openStream();
        if(item.isFormField()){
            
            String str=Streams.asString(stream);
            if(nam.equals("movie_name")){
                movie_name=str;
            }
            else if(nam.equals("duration")){
                duration=str;
            }
            else if(nam.equals("fare")){
                fare=str;
            }
            else if(nam.equals("seats")){
                seats=str;
            }
            else if(nam.equals("date")){
                date=str;
            } 
            else if(nam.equals("uid")){
                uid=str;
            } 
            
        }
        else if(item.getName()!=""){ 
            if(nam.equals("image"))
            {
            File f=new File("C:\\Users\\Avishna\\OneDrive\\Desktop\\JAVA-Projects\\SeafarerVoyager\\web\\static\\images\\movie\\"+item.getName().substring(item.getName().lastIndexOf("\\") + 1));
            file=item.getName().substring(item.getName().lastIndexOf("\\") + 1);
            if(!f.exists())
            {
                f.createNewFile();
            }
            FileOutputStream fos=new FileOutputStream(f);
            int ch;
            while((ch=stream.read())!=-1)
            {
                fos.write(ch);
            }
            }
         
            }                
    }
                      st.executeUpdate("update movie set movie_name='"+movie_name+"',duration='"+duration+"',fare='"+fare+"',seats='"+seats+"',image='"+file+"',date='"+date+"' where movie_id='"+uid+"' ");
   

//           response.sendRedirect("admin_manage_product.jsp");
          %>
   <script>
       alert("Updated successfully");
       window.location="admin_addmovie.jsp";
   </script>
<% 

%>
