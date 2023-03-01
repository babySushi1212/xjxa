<%@page contentType="text/html;charset=UTF-8"%>
<%
//  String memeName="Sara";
  String memeName = request.getParameter("memeName");
  String memName="";

  if( memeName.equals("Sara"))
    memName = "董董";
  else if( memeName.equals("Amy"))
    memName = "婷婷";
  else
    memName = "查無此人";
  out.print(memName);
%>