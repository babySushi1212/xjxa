<%@page contentType="text/html;charset=utf-8"  language="java" import="java.sql.*" errorPage=""%>
<%@page import="org.json.*"%>
<%
//載入JDBC驅動程式類別 
// Class.forName("com.mysql.cj.jdbc.Driver");
// Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sample","user", "password"); 

//取得前端送來的資料

//準備好sql指令

//代入資料

//執行sql指令


//----------------準備打算輸出的JSON資料
//先產生JSON陣列物件

//取得每列的欄位數


  //當讀的到一列資料時
    //產生一個JSON物件

	//該列資料的所有欄位加到該物件中
    //(欄位名稱為key, 取出欄位的值)

    //將此列物件放入jsonArray中

//----------------輸出JSON資料
%>