<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<%
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> lists = dao.getAllMembers();
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">아이디</th>
				<th scope="col">패스워드</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
			</tr>
		</thead>
		<tbody>
			<%
			int count = 0;
			for (MemberDTO dto : lists) {
				count++;
			%>
			<tr>
				<th scope="row"><%=count%></th>
				<td><%=dto.getId()%></td>
				<td><%=dto.getPassword() %></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getEmail()%></td>
				<td><a
					href="memberDelete.jsp?id=<%= dto.getId()%>&password=<%= dto.getPassword()%>">
						Delete </a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>