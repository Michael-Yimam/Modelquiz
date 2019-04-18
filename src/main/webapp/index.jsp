<%@ page import="com.modelquiz.java.Grade" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.modelquiz.java.Quiz" %>
<!-- Make sure the JSP is allow access session. -->
<%@ page session="true" %>
<html>
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
        <p>Guess the next number in the sequences.</p>
        <p>
            <%
                String[] question = ((Quiz)request.getSession().getAttribute("quiz")).questions;
                out.println(request.getSession().getAttribute("qNumber"));
            %>
        </p>

        <form action='getQuiz' method='post'>
            <p> Your answer: <input name = 'guess' type='text' size='5'></p>
        <input type='submit' value='submit'></form>

    </body>
</html>
