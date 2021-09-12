<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  request.setCharacterEncoding("utf-8");
  String searchText = request.getParameter("searchText");

	String url_mysql = "jdbc:mysql://localhost/Market?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "select pCode, pCategory, pName from Product where pDelete = 0 and pName like '%" + searchText + "%'";
    // String WhereDefault = "select pCode, pCategory, pName from Product where pDelete = 0 and pName like '%치%'";
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
                    if (count == 0) {

                    }else{
        %>
                    ,
        <%
                    }
                    count++;
        %>
        			{
        			"code" : "<%=rs.getString(1) %>",
        			"category" : "<%=rs.getString(2) %>",
        			"name" : "<%=rs.getString(3) %>"
        			}
        <%
                }
        %>
        		]
            }
        <%
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
