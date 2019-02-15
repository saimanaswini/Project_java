
<%@page import="java.sql.*" %>

<%

String uname=request.getParameter("uname");
//out.println(uname);

Long pword=Long.parseLong(request.getParameter("password"));
//out.println(pword);

int checking=0;

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");

Statement st1=con.createStatement();

ResultSet rs1=st1.executeQuery("select checking from gg_login where email="+"'"+uname+"' and phno="+"'"+pword+"'");

if(rs1.next())
{
	checking=rs1.getInt(1);
  //out.println(checking);	  
}



Statement st3=con.createStatement();

int count=st3.executeUpdate("update gg_login set checking=1 where email="+"'"+uname+"' and phno="+"'"+pword+"'");

//out.println(con);

PreparedStatement ps=con.prepareStatement("select count(*) from gg_login where email=? and phno=?");

ps.setString(1,uname);

ps.setLong(2,pword);

Statement st=con.createStatement();

ResultSet rs2=st.executeQuery("select name from gg_login where email="+"'"+uname+"' and phno="+"'"+pword+"'");

String name_stu=null;

if(rs2.next())
{
	 name_stu=rs2.getString(1);
	 //out.println(name_stu);
}




ResultSet rs=ps.executeQuery();

if(rs.next())
{
	int res=rs.getInt(1);
	//out.println(res);
	if(res==0)
	{
		out.println("<center><h2 style='color:red'>Login failed  Please Try again</h2></center>");
		
	      %> 
		
        <%@include file="student.html"%>   
				
		<%
		
	}
	
	if(count==1 && res!=0 && checking==0)
	{
		out.println("<center><h2 style='color:Green;margin-top:10px'>Login Successful Welcome "+ name_stu.toUpperCase()+" You can fill this form only once</h2></center>");
		
	      %> 
		
		
		  <%@include file="studentpage.html"%>
        
		
    <%
			
	}
	
	if(checking>1)
	{
		out.println("<center><h1 style='color:red'>You have already filled this @"+name_stu.toUpperCase()+"</h1></center>");
	}
	
  }



%>

