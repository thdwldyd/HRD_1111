<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>쇼핑물회원관리 프로그램</h2>
<p>
<pre>쇼핑물 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
프로그램 작성 순서
1.회원정보 테이블을 생성한다.
2.매출정보 테이블을 생성한다.
3.회원정보,매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.
4.회원정보 입력 화면프로그램을 작성한다.
5.회원정보 조회 프로그램을 작성한다.
6.회원매출정보 조회 프로그램을 작성한다.
7.
8.
9................
</pre>
</p>
</section>

<footer>HRDKOREA Copyright@2016 All rights reserved. Human Resources Development Service of Korea</footer>
</body>
</html>