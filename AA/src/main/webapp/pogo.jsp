<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
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
	try{
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myserv","root","root");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select ename, address, hobbies from employee");
	
	if(rs.next())
	{
		String ename = rs.getNString(1);
		String address = rs.getNString(2);
		String hobbies = rs.getNString(3);
		System.out.println(ename + " " +address +  " " + hobbies);
		
		
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();			
	}

%>
</body>
</html>