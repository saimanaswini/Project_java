
<%@page import="java.sql.*" %>

<%

String uname=request.getParameter("uname");
//out.println(uname);

Long pword=Long.parseLong(request.getParameter("password"));
//out.println(pword);

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

//out.println(con);

PreparedStatement ps=con.prepareStatement("select count(*) from gg_login_professor where uname=? and pword=?");

ps.setString(1,uname);

ps.setLong(2,pword);

ResultSet rs=ps.executeQuery();

if(rs.next())
{
	int res=rs.getInt(1);
	//out.println(res);
	if(res==0)
	{
		out.println("<center><h2 style='color:red'>Login failed  Please Try again</h2></center>");
		
	      %> 
		
        <%@include file="professor.html"%>   
				
		<%
		
	}
	
	else
	{
		
		
	      %> 
		
		
		  <%@include file="professorpage.jsp"%>
        
		
          
				
		<%
		
	}
	
}

%>

