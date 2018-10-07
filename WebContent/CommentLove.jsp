<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBerror.jsp" %>
     <%@ page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("UTF-8");
   

    String dLove=request.getParameter("LOVE");

    System.out.println(dLove);
    String dNo=request.getParameter("NO");

    System.out.println(dNo);
  
    String dburl = "jdbc:mysql://localhost:3306/nogaridb";
    String dbuser = "root";
    String dbpass = "1234";

    Connection conn =null;
    Statement stmt = null;
    
    String query=String.format("UPDATE `nogaridb`.`commenttbl` SET `love`='%s' WHERE `no`='%s';"
    ,dLove,dNo);

    try{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection(dburl,dbuser,dbpass);
    	
    	if(conn == null)
    		throw new Exception("DB 연결 실패");
    	
    	stmt = conn.createStatement();
    	
    	int rowCnt = stmt.executeUpdate(query);
    	
    	if(rowCnt <1){
    		throw new Exception("수정실패");
    	}else{
    		String xmlstr = "<CONTENT> ";
    		xmlstr +="<STATE> </STATE> ";
    		xmlstr +="</CONTENT>";
    		
    		out.print(xmlstr);
    		
    	}
    	
    }finally{
		try{
    		if(stmt != null)
    			stmt.close();
    		if(conn != null)
    			conn.close();
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    %>