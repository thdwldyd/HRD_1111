<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mylib.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//여러데이터를 리스트에 담아서 아래쪽ㅇ에서 한번에 출력한다.
   Class.forName("oracle.jdbc.driver.OracleDriver");
   //3)db접속
   Connection conn=DriverManager.getConnection(
         "jdbc:oracle:thin:@localhost:1521:xe"
         ,"system"
         ,"1234");
   String sql="select t1.custno custno,t2.custname custname, ";  
   sql+="decode(t2.grade, 'A','VIP','B','일반','C','직원') grade, ";
   sql+="sum(t1.price)";
   sql+="from money_tbl_02 t1,member_tbl_02 t2 where t1.custno=t2.custno"; 
   sql+=" group by (t1.custno,t2.custname,t2.grade)"; 
   sql+=" order by sum(t1.price) desc";

    //out.print(conn);
    PreparedStatement ps=conn.prepareStatement(sql);
    ResultSet rs=ps.executeQuery();

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin:0; padding:0;}

header{
   height:100px;
   background-color: blue;
   color:  white;
   font-size:30px;
   text-align:center;
   line-height:100px
   /* padding: 100px 50px;  위아래 좌우*/
   
}

nav{
   background-color: rgba(130,100,255);
      color: white;
      /* text-align: center; */
}
   nav>ul>li{display: inline-block;
      padding:20px 30px;
   }


section{
   height:500px;
   background-color: gray;
   color: black;
}
section>h2{
text-align:center;
padding-top: 15px;
padding-bottom: 20px;
}

footer{
   background-color: darkblue;
   color: white;
   font-size:10px;
   text-align:center;
   line-height:80px
   }
table{
margin:auto;
text-align:center;
}
li a{
color:white;
text-decoration: none;
}
</style>
</head>
<body>
<header>쇼핑물 회원관리ver1.0</header>

<nav>
   <ul>
      <li><a href="createmember.jsp">회원등록</a></li>
      <li><a href="memberlist.jsp">회원목록조회/수정</a></li>
      <li><a href="sales.jsp">회원매출조회</a></li>
      <li><a href="index.jsp">홈으로</a></li>
   </ul>
</nav>

<section>
<h2>회원목록조회/수정</h2>
<p>
<table border="1" width=70%>
<tr>
   <th>회원번호</th>
   <th>회원성명</th>
   <th>고객등급</th>
   <th>매출</th>
</tr>
<%while(rs.next()){ %>

<tr>
   <td><%=rs.getInt(1)%></td>
   <td><%=rs.getString(2) %></td>
   <td><%=rs.getString(3) %></td>
   <td><%=rs.getInt(4) %></td>

</tr>
<%}
rs.close();ps.close();conn.close();
%>
</table>
</p>
</section>

<footer>HRDKOREA Copyright@2016 All rights reserved. Human Resources Development Service of Korea</footer>
</body>
</html>