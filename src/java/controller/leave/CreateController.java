/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.leave;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.LeaveRequestDBContext;
import data.LeaveRequest;
import data.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author Lenovo
 */
public class CreateController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String title = req.getParameter("title");
        String reason = req.getParameter("reason");
        String from = req.getParameter("from");
        String to = req.getParameter("to");

        LeaveRequest lr = new LeaveRequest();
        lr.setTitle(title);
        lr.setReason(reason);
        lr.setFrom(Date.valueOf(from));
        lr.setTo(Date.valueOf(to));
        lr.setCreatedby(user);

        LeaveRequestDBContext db = new LeaveRequestDBContext();
        db.insert(lr);
        System.out.println("inserted successful!");
        resp.getWriter().print(lr);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("../view/leave/request.jsp").forward(req, resp);

    }

}
