 <%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question 2</title>
</head>
<body>
<form action="search.jsp" method="get">
        <table>
            <tr>
                <td>Enter name to search : </td>
                <td><input type="text" required="required" minlength="2" name="myname"></td>
            	   <td><input type="submit" ></td>
            </tr>

        </table>



    </form>
    
    <%
    	PrintWriter outt = response.getWriter();
    	session.getAttribute("fans");
    	if(session.getAttribute("fans")==null)
    	{
    		outt.print("No Result Found");
    		
    	}
    	else
    	{
    		
    		outt.print(session.getAttribute("fans"));
    	}
    
    %>
    
    <%=
    session.getAttribute("fans")
    
    %>
    



</body>
</html>