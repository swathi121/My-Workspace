<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:ora","scott","tiger");

	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
			ResultSet.CONCUR_UPDATABLE);
	String usr =request.getParameter("user");
	String key =request.getParameter("key");
	
	String query="select * from teacher where tname='" + usr + "'and tpassword='" + key + "'";
	ResultSet rs = st.executeQuery(query);
	rs.absolute(1);
	String s1="";
	String s2="";
  	while(rs.next()){
	s1=rs.getString(1);
	s2=rs.getString(2);
	}
if(usr.equalsIgnoreCase(s1)&&key.equalsIgnoreCase(s2))
	{	
		out.println("login success"); 
		
		response.sendRedirect("view.html");
	}
	else
	{
		out.println("<h1>Login Incorrect</h1>");
		out.println("<a href=\"login.html\" >Sign In</a>");
		
	}
}
catch(Exception e)
{
	e.printStackTrace();
}	
%>   
<html><head>
<script type="text/javascript">
function noBack(){window.history.forward();}
noBack();
window.onload=noBack;
window.onpageshow=function(evt){if(evt.persisted)noBack();}
window.onunload=function(){void(0);}
</script>
</head>

	<frameset rows="12%,*" frameborder=0 framespaceing=0>

		<frame src="..\header.html" border=0 scrolling=no>

		<frameset cols="25%,*" frameborder=0>
			<frame src="list.html" border=0 scrolling=no>
			<frame src="..\default.html" name="dest" border=0>	
		</frameset>
	</frameset>
</html>	
