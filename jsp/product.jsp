<%@page import="dao.ProductDAO"%>
<%@page import="common.FileUtil"%>
<%@page import="java.io.File"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");
ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
List<FileItem> items = sfu.parseRequest(request);
Iterator iter = items.iterator();
String id = null, content = null, fname = null;
byte[] data = null;
ProductDTO dto = new ProductDTO();
while(iter.hasNext()) {
	FileItem item = (FileItem)iter.next();
	String name = item.getFieldName();
	if(item.isFormField()) {
		String value = item.getString("utf-8");
		if(name.equals("name")) dto.setName(value);
		else if(name.equals("content")) dto.setContent(value);
		else if(name.equals("category")) dto.setCategory(value);
		else if(name.equals("price")) dto.setPrice(value);
	}else {
		if(name.equals("images")) {
			fname = item.getName();
			dto.setImages(fname);
			data = item.get();
			String root = application.getRealPath(File.separator);
			FileUtil.saveImage(root, fname, data);
			System.out.println(root);
		}
	}
}
ProductDAO dao = new ProductDAO();
try{
	dao.insertProduct(dto);
	response.sendRedirect("../html/adminHome.html");
}catch(Exception e) {
	request.setAttribute("errorCode", 1);
	request.getRequestDispatcher("error.jsp").forward(request, response);
}

%>
</body>
</html>