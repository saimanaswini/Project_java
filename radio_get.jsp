<%@page import="java.sql.*" %>

<%

String val=request.getParameter("feedback");
//out.println(val);


String name=request.getParameter("per_name");
//out.println(name);

String review=request.getParameter("comment");
//out.println(review);

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from feedback where name=name");

while(rs.next())
{
	String s=rs.getString(1);
	//out.println(s);
	
	if(rs.getString(1).equals(name))
	{
		out.println("<h2 style='color:red'>You have already filled Your record will be saved again, but only the last values will be considered");
		break;
	}
}

PreparedStatement ps=con.prepareStatement("insert into feedback values(?,?,?)");

ps.setString(1,name);

ps.setString(2,val);

ps.setString(3,review);


int count=ps.executeUpdate();


if(count==0)
{
	out.println("feedback not saved please do it again");
	
	%>
	
	<%@include file="radio.html"%>
	
	<%
}

else
{
	out.println("<h2 style='margin-top:20px;margin-bottom:0px;padding:15px;background-color:mediumseagreen;color:white;font-weight:bold;border-radius:40px;background:linear-gradient(to bottom,mediumseagreen,grey);width:35%;;margin-left:400px;'>your feedback is saved successfully thank q</h2>");
}


%>