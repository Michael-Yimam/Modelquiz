<%@ page import="com.modelquiz.java.Grade" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: 986957
  Date: 4/18/2019
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>The Number Quiz</h1>
<p>
    Your current score is
    <%

        if(request.getSession().getAttribute("qNumber") == null){

            response.sendRedirect("getQuiz");
        }

        else{
            int[] grades = ((Grade)request.getSession().getAttribute("grade")).grade;
            out.println(Arrays.stream(grades)
                    .reduce(0, Integer::sum));
        }

    %>
</p>
    <p>You have completed the Number Quiz, with a score of
        <%
            int[] grades = ((Grade)request.getSession().getAttribute("grade")).grade;
            out.println(Arrays.stream(grades)
                    .reduce(0, Integer::sum));

            request.getSession().invalidate();
        %> out of 5.</p>"

</body>
</html>
