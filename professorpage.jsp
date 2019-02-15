
<%@page import="java.sql.*" %>



<%

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

PreparedStatement ps1=con1.prepareStatement("select count(want) from gg_results where want='Yes' or want='Neutral'");

ResultSet rs1=ps1.executeQuery();

out.println("<center style='border:4px double royalblue;width:40%;height:380px;padding:20px;margin-left:400px;border-radius:20px;background-image:linear-gradient(to right,salmon,lightgrey);color:white;font-size:20px;'>");
if(rs1.next())
{
	out.println("No. of students who supported for gg tomorrow till now::"+rs1.getInt(1)+" <br> <br> <br> <br> <br> <br>");
}

else
{
	out.println("some error please contact the crs to resolve   <br> <br> <br> ");
	//out.println("</center>");
}


%>

 <a href="professor_result.html" style="border:4px double mediumseagreen;border-radius:20px;background:royalblue;color:white;padding:10px;text-decoration:none;box-shadow:inset 0 0 8px white;font-weight:bold;">NEXT</a>

<%

out.println("</center>");




%>