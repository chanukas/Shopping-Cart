<%--
  Created by IntelliJ IDEA.
  User: Chanuka Sandaruwan
  Date: 2018-06-18
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%


    Cookie[] cookies = request.getCookies();
    String otpCookie = null;
    String video_idCookie = null;
    int user_idCookie = 0;
    boolean b = false;

    if(cookies!=null){
        for (int i = 0; i < cookies.length; i++) {
            Cookie cookie = cookies[i];
            for (int j=0;j<25;j++) {
                if (cookie.getName().equals(j+"")){
                    System.out.println(cookie.getValue());
                }
            }
        }

    }


%>

</body>
</html>
