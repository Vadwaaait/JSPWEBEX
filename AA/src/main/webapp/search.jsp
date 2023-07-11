 <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String myname = request.getParameter("myname").toString();

	HttpSession sess=request.getSession();
	String fans;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserv","root","root");
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myserv","root","root");
		Statement st = con.createStatement();
		System.out.print("        After Statement" );
		String query = "select ename, address, hobbies from employee where ename ='" +myname+"'";
		ResultSet rs = st.executeQuery(query);
		
		System.out.print("After rs" );
		if(rs.next())
		{
			
			String ename=rs.getString(1);
			String address=rs.getString(2);
			String hobbies=rs.getString(3);
			
			 fans = "Name : " +ename +", Address : "+address+" , Hobbies : " + hobbies;
			 PrintWriter pw = response.getWriter();
				pw.print("Answer is : "+ fans);
			sess.setAttribute("fans", fans);
			request.getRequestDispatcher("myserv.jsp").forward(request, response);
			
			
		}
		else
		{
			sess.setAttribute("fans", "noans");
			request.getRequestDispatcher("myserv.jsp").forward(request, response);
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.print("         In Catch Block" +e.getMessage() );
		e.printStackTrace();
		
	}
	finally{
		
		
	}


	
	
	
	
	
	
%>

	

</body>
</html> 