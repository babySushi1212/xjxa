<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="org.json.JSONObject" %>
<%

    JSONObject empJson = new JSONObject();

    Class.forName("com.mysql.cj.jdbc.Driver");
    try (
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db01?serverTimezone=Asia/Taipei",
                    "root",
                    "abcd1234");

            PreparedStatement STMT = conn.prepareStatement("SELECT * FROM emp2 WHERE empno = ?");
    ) {
        // put front-end request empno into PreparedStatement sql query comment
        STMT.setInt(1, Integer.parseInt(request.getParameter("empno")));
        try (ResultSet rs = STMT.executeQuery()) {
            while (rs.next()) {
                empJson.put("name", rs.getString("ENAME"));
                empJson.put("job", rs.getString("JOB"));
                empJson.put("salary", rs.getDouble("SAL"));
            }
        }
    }
    out.print(empJson);
%>


