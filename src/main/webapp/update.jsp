<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="mylib.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int custno=Integer.parseInt(request.getParameter("custno"));
out.print(custno);
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection(
         "jdbc:oracle:thin:@localhost:1521:xe"
         ,"system"
         ,"1234");
  String sql="select * from member_tbl_02 where custno=?";
  PreparedStatement ps=conn.prepareStatement(sql);
  ps.setInt(1,custno);
  ResultSet rs=ps.executeQuery();
   Member Member=new Member();
  if(rs.next()){
     Member.setCustno(rs.getInt("custno")); //함수에 필요로하는 정수를 출력
     Member.setCustname(rs.getString("custname"));
     Member.setPhone(rs.getString("phone"));
     Member.setAddress(rs.getString("address"));
     Member.setJoindate(rs.getDate("joindate"));
     Member.setGrade(rs.getString("grade"));
     Member.setCity(rs.getString("city"));   
  } 
     rs.close();ps.close();conn.close();
     //out.print(Member.toString());
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
   
table {
   margin-left: auto; 
   margin-right: auto;
   text-align:center
}
li a{
color:white;
text-decoration: none;
}
</style>
<script>
function valuecheck(){
   var custno=document.getElementById("custname");
   var phone=document.getElementById("phone");
   var address=document.getElementById("address");
   var joindate=document.getElementById("joindate");
   var grade=document.getElementById("grade");
   var city=document.getElementById("city");
   if(custname.value==""){
      alert("회원성명이 입력되지 않았습니다");
      custname.focus();
      return false;
   }
   if(phone.value==""){
      alert("회원전화가 입력되지 않았습니다");
      phone.focus();
      return false;
   }
   if(address.value==""){
      alert("회원주소가 입력되지 않았습니다");
      address.focus();
      return false;
   }
   if(joindate.value==""){
      alert("가입일자가 입력되지 않았습니다");
      joindate.focus();
      return false;
   }
   if(grade.value==""){
      alert("고객등급이 입력되지 않았습니다");
      grade.focus();
      return false;
   }
   if(city.value==""){
      alert("거주도시가 입력되지 않았습니다");
      city.focus();
      return false;
   }
}
</script>
</head>
<body>
<header>쇼핑물 회원 등록</header>

<nav>
   <ul>
      <li><a href="createmember.jsp">회원등록</a></li>
      <li><a href="memberlist.jsp">회원목록조회/수정</a></li>
      <li><a href="sales.jsp">회원매출조회</a></li>
      <li><a href="index.jsp">홈으로</a></li>
   </ul>
</nav>

<section>
<h2>홈쇼핑 회원 정보 수정</h2>
<p>
<form action="updateproc.jsp" method="post" onsubmit="return valuecheck()">
<table border='1'>
<tr>
<td>회원번호(자동발생)</td>
<td><input type="text" id="custno" name="custno" value="<%=Member.getCustno() %>"></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type="text" id="custname" name="custname" value="<%=Member.getCustname() %>"></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type="text" id="phone" name="phone" value="<%=Member.getPhone() %>"></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type="text" id="address" name="address" value="<%=Member.getAddress() %>"></td>
</tr>
<tr>
<td>가입일자</td>
<td><input type="text" id="joindate" name="joindate" value="<%=Member.getJoindate() %>"></td>
</tr>
<tr>
<td>고객등급[A:VIP,B:일반C:직원]</td>
<td><input type="text" id="grade" name="grade" value="<%=Member.getGrade()%>"></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type="text" id="city" name="city" value="<%=Member.getCity() %>"></td>
</tr>
<tr>
<td colspan=2>
<input type="submit" value="수정">
<input type="button" value="조회"  onclick="javascript:location.href='memberlist.jsp'">
</td>
</tr>
</table>
</form>
</p>
</section>

<footer>HRDKOREA Copyright@2016 All rights reserved. Human Resources Development Service of Korea</footer>
</body>
</html>