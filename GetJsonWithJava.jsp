<%@page contentType="text/html;charset=utf-8" %>
<%@page import="org.json.JSONObject" %>
<%
    /*
    建立json物件:emp,內含ename屬性(值:Linsanity)及phone屬性,
    其中phone屬性為一個json物件,內含屬性 O (值: 034257387 ),屬性 H (值: 03168168 ), 屬性 M (值: 0933168168)
    */
    JSONObject emp = new JSONObject();
    JSONObject phone = new JSONObject();

    emp.put("ename", "Jhon");
    phone.put("O", "123");
    phone.put("H", "456");
    phone.put("M", "7899");
    emp.put("phone", phone);

    out.print(emp);

//輸出JSON
%>