package com.modelquiz.servlets;

import com.modelquiz.java.Grade;
import com.modelquiz.java.Quiz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "QuizServlet", urlPatterns = {"/getQuiz"})
public class QuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("post hi");

        HttpSession s = request.getSession(false);
        if(s == null)
        {
            doGet(request, response);
        }else{

            s = request.getSession();

            int guess = 0;
            int qNumber = (Integer)s.getAttribute("qNumber");

            if(qNumber > Quiz.questions.length){
                doGet(request, response);
                return;
            }

            Grade g = (Grade) s.getAttribute("grade");

            try{

                guess = Integer.parseInt(request.getParameter("guess"));

            }catch(NumberFormatException nfe){
                System.out.println(nfe);
            }


            if(Quiz.gradeQuiz(qNumber, guess)){
                g.grade[qNumber-1] = 1;
                s.setAttribute("grade", g);
            }

            qNumber++;
            s.setAttribute("qNumber", qNumber);

            if(qNumber > 5){
                response.sendRedirect("result.jsp");
                return;
            }
            response.sendRedirect("index.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("get hi");

        HttpSession s = request.getSession();
        s.setAttribute("quiz", new Quiz());
        s.setAttribute("qNumber", 1);
        s.setAttribute("grade", new Grade());

        response.sendRedirect("index.jsp");
    }
}
