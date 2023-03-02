<%@page contentType="text/html;charset=UTF-8" %>
<%
    String memeName = request.getParameter("memeName");
    String memName;

    if (memeName.equals("Sara")) {
        memName = "Sara registered";
    } else if (memeName.equals("Amy")) {
        memName = "Amy registered";
    } else {
        memName = "name available";
    }
    out.print(memName);
%>