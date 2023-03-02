<%@page contentType="text/html;charset=utf-8" %>
<%
    String memId = request.getParameter("memeName");
    String memName;

    if (memId.equals("Sara")) {
        memName = "Sara Registered";
    } else if (memId.equals("Amy")) {
        memName = "Amy Registered";
    } else {
        memName = "Name Available";
    }
    out.print(memName);
%>