/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.leave;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.LeaveRequestDBContext;
import data.LeaveRequest;
import data.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Lenovo
 */
public class ReviewController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String id = req.getParameter("id");
        String action = req.getParameter("action");
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        LeaveRequest l = db.getByID(Integer.parseInt(id));
        int status = action.equals("approved") ? 2 : 1;

        db.update(l.getId(), status);
        resp.sendRedirect("../leaverequest/manager/list");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String id = req.getParameter("id");
        LeaveRequestDBContext lr = new LeaveRequestDBContext();
        LeaveRequest l = lr.getByID(Integer.parseInt(id));
        req.setAttribute("l", l);
        req.setAttribute("id", id);
        req.getRequestDispatcher("/view/leave/approval.jsp").forward(req, resp);

    }

}
