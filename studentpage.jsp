
<%@page import="java.sql.*" %>



<%

out.println("<center style='border:4px double royalblue;width:40%;height:380px;padding:20px;margin-left:400px;border-radius:20px;background-image:linear-gradient(to right,salmon,grey);color:white'>");

out.println("<h2 style='background:black;padding:4px;border-radius:20px;'>CHECK THE OPINION YOU GAVE</h2>");

String que1_ans=request.getParameter("radio");
out.println("<h3>you want gg??</h3>"+que1_ans+"<br>");


String que2_ans=request.getParameter("radio2");
out.println("<h3>will you break gg if declared??</h3>"+que2_ans+"<br>");


String remarks=request.getParameter("remarks");
out.println("<h3>your comments::</h3>"+remarks+"<br>");




Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

PreparedStatement ps=con.prepareStatement("insert into gg_results values(?,?,?)");

ps.setString(1,que1_ans);

ps.setString(2,que2_ans);

ps.setString(3,remarks);

int res=ps.executeUpdate();

if(res==0)
{
	out.println("not inserted");
}

else
{
	out.println("your opinion is saved  <br> <br> <br> ");
	//out.println("</center>");
}



%>

 <a href="radio.html" style="border:4px double mediumseagreen;border-radius:20px;background:royalblue;color:white;padding:10px;text-decoration:none;box-shadow:inset 0 0 8px white;font-weight:bold;">NEXT</a>

<%

out.println("</center>");




%>