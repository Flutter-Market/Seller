<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String url_mysql = "jdbc:mysql://localhost/Market?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select * from Product where pDelete = 0 and pStatus = '품절'";
    int count = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // &quot;
%>
    {"results" :
  	    [
<%
        while (rs.next()) {
            count++;
          }
%>
			{
			"count" : "<%=count %>"

    }

		]
    }
<%
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
