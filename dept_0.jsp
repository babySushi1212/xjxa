<%@page contentType="text/html;charset=utf-8"  language="java" import="java.sql.*" errorPage=""%>
<%
//載入JDBC驅動程式類別 
//Class.forName("com.mysql.cj.jdbc.Driver");
//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei","David", "123456");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sample","root", "root"); 
  
//建立Statement物件
PreparedStatement deptStmt = conn.prepareStatement("select * from dept") ;
 
//執行sql指令
ResultSet rs = deptStmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>部門員工資料</title>
<style type="text/css">
	.empsTable th{
		background-color:#bfbfef;
	}
	.empsTable td{
		width:160px;
		border-bottom:1px dotted deeppink;
	}
</style>
</head>
<body>
<!-- 將部門資料放入選單中 -->
<select id='deptNo'>
	<%
	while(rs.next()){
		out.println("<option value='" + rs.getString("deptno") + "'>" + rs.getString("dname") + "</option>");
	}
	%>
</select>
<br>
<div id="showPanel"></div>
<%  
//關閉ResultSet物件 	
rs.close();
//關閉Statement物件    
deptStmt.close();
//關閉Connection物件 	 
conn.close(); 
%>

<script>
function showEmps(json){
	let emps = JSON.parse(json); //陣列中含物件
	let html = "<table class='empsTable'>";
	html += "<tr><th>名字</th><th>薪資</th><th>到職日</th></tr>";

	if(emps.length == 0){
		html += "<tr><td colspan='3'>此部門尚無員工~</td></tr>";
	}else{
		for(let i=0; i<emps.length; i++){
			html += "<tr><td>" + emps[i].ename
				 + "</td><td>" + emps[i].sal
				 + "</td><td>" + emps[i].hiredate
				 +"</td></tr>";
		}		
	}

	html += "</table>";
	document.getElementById("showPanel").innerHTML = html;
}	

function getEmps(e){
	let deptNo = e.target.value;
	let xhr = new XMLHttpRequest();

	xhr.onload = function(){
		showEmps(xhr.responseText);
	}
	let url = "dept_getEmps.jsp?deptNo=" + deptNo;
	xhr.open("get", url, true);
	xhr.send(null);
}	

window.addEventListener("load", function(){
	//------註冊下拉式選單
	document.getElementById("deptNo").onchange = getEmps;
})

</script>
</body>
</html>