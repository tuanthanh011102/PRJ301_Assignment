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
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class ListController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        ArrayList<LeaveRequest> list = db.list(user.getUsername());
        req.setAttribute("list", list);
        req.getRequestDispatcher("../view/leave/list.jsp").forward(req, resp);
       
    }
   
   
}
