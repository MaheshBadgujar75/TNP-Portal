<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@include file="header.jsp" %>
 <%@include file="variables.jsp" %>
 <script type="text/javascript" src="jquery/jquery1.js"></script>
             
<%
    if(session.getAttribute("name")==null)
{
    response.sendRedirect("Login.jsp");
}
  
   %>


      <body>
<script type="text/javascript">  
         $(document).ready(function(){
                $(".business").click(function(){
                  
                    var a=$(this).val()
                    if(a==2)
                    {
                    $.ajax({
                        url:"selection.jsp",
                        data:{"val":a},
                        beforeSend:function (){
                           
                            $("#ans").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                           $("#ans").html(data)          
                        })
                    }
                    else
                    {
                        $("#ans").html("") 
                    }
                })
           })
       
    </script> 
    <script>
            $(document).ready(function(){
                $(".business").click(function(){
                  
                    var b=$(this).val()
                    if(b==3)
                    {
                    $.ajax({
                        url:"selection.jsp",
                        data:{"val":b},
                        beforeSend:function (){
                           $("#ans1").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                      $("#ans1").html(data)          
                        })
                    }
                    else
                    {
                         $("#ans1").html("")      
                    }
                })
            })
    </script> 
       <script>
            $(document).ready(function(){
                $(".business").click(function(){
                  
                    var c=$(this).val()
                    if(c==4)
                    {
                    $.ajax({
                        url:"selection.jsp",
                        data:{"val":c},
                        beforeSend:function (){
                           $("#ans2").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                                 
                      
                          $("#ans2").html(data)          
                        })
                    }
                    else
                    {
                         $("#ans2").html("")      
                    }
                })
            })
    </script> 
       <script>
            $(document).ready(function(){
                $(".business").click(function(){
                  
                    var d=$(this).val()
                    if(d==5)
                    {
                    $.ajax({
                        url:"selection.jsp",
                        data:{"val":d},
                        beforeSend:function (){
                           $("#ans3").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                        $("#ans3").html(data)          
                        })
                    }
                    else
                    {
                       $("#ans3").html("")      
                    }
                })
            })
    </script> 
   
   <div class="container">
  
            <h1 align='center'>Student Declaration</h1>
         <pre>
To 
The Principal,
DAVIET,
Jalandhar.

<b>SUBJECT : Declaration By Student.</b>

Respected Sir, 
I <input type='text' value=<%= session.getAttribute("name")%> disabled> class Roll no. <input type='text' value=<%= session.getAttribute("rno")%> disabled>, 
student of final year hereby declare that after completing my degree I would like to choose the following option.
            </pre>   
<form name="form2">
             <table width="50%"  cellpadding="15px" cellspacing="30px" border="2px">
                
                 <thead> <tr ><th colspan="2">
                            <h2 align='center'>Select One of your choice</h2>  </th></tr>
                    <tr><td>1. Will Join The Placement Provided By The Institute </td><td><input type='radio' name='select' value='1' class="business"></td></tr>
                    <tr><td> 2. Will Venture Into Entrepreneurship Or Family Business <br><br><div id="ans">
                      
                            </div></td><td><input type='radio' name='select' value='2' class="business"></td></tr>
                   
                      <tr><td>3. Will Go For Higher Studies <div id="ans1">
                          </div></td><td><input type='radio' name='select' value='3' class="business" ></td></tr>
                          <tr><td> 4. Will Explore Career In Defence Forces<div id="ans2">
                          </div>
                            </td><td> <input type='radio' name='select' value='4' class="business"></td></tr>
                        <tr><td>5. Any Other Option!
                                <br><br> <div id="ans3">
                          </div></td><td><input type='radio' name='select' value='5' class="business"></td></tr>
                        <tr><td colspan="2"><h3 align="center"><input type='submit' name='submit' value='Submit'></h3></td></tr>
                    
             </table>
</form>
          </div>
    <br><br>
     <%
      if(request.getParameter("submit")!=null)
      {
      try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="insert into selectionresult (`seid`, `email`, `options`, `ans`) values(?,?,?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, request.getParameter("select"));
mystatement.setString(2, session.getAttribute("mail").toString());
if(Integer.parseInt(request.getParameter("select"))==2)
{
    mystatement.setString(3,request.getParameter("busi"));
mystatement.setString(4,request.getParameter("desbusiness"));
}
else if(Integer.parseInt(request.getParameter("select"))==3)
{
     mystatement.setString(3,request.getParameter("study"));
mystatement.setString(4,request.getParameter("desstudy"));
}
else if(Integer.parseInt(request.getParameter("select"))==4)
{
     mystatement.setString(3,request.getParameter("defence"));
mystatement.setString(4,String.valueOf("0"));
}
else if(Integer.parseInt(request.getParameter("select"))==5)
{
     mystatement.setString(3,String.valueOf("0"));
        mystatement.setString(4,request.getParameter("specify"));
}
else
{
     mystatement.setString(3,String.valueOf("0")); 
mystatement.setString(4,String.valueOf("0"));
     
}

if(mystatement.executeUpdate()==1)
{ 
    String m=session.getAttribute("course").toString(); 
    String f[]=m.split(",");
 if(f[1].equalsIgnoreCase("Btech"))
  response.sendRedirect("btech1.jsp");
    else if (f[1].equalsIgnoreCase("MTech"))
         response.sendRedirect("Mtech.jsp");
    else  if(f[1].equalsIgnoreCase("MCA"))
         response.sendRedirect("Mca.jsp");
   
 else if(f[1].equalsIgnoreCase("MBA"))
         response.sendRedirect("mba.jsp");
 else
 {
     response.sendRedirect("btech1.jsp");
 }
   }
else
{
        out.println("<h1>fdbdgbgfhgfhjgfjdfkidan</h1>");
        }
}
catch(Exception e)
{
out.println("Error in Query " + e.getMessage());
}
finally
{
    myconnection.close();
}
}
catch(Exception e)
{
out.println("Error in Connection " + e.getMessage());
}

    }
      
     %>
      </body>
                                 
       
             
</html>
<%@include file="footer.jsp" %>