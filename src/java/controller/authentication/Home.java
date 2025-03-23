/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authentication;

import data.Feature;
import data.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Home extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override 
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        List<Feature> f = new ArrayList<>();
        user.getRoles().forEach(role
                -> role.getFeatures().stream()
                        .filter(feature -> !feature.getUrl().contains("/leaverequest/review"))
                        .filter(feature -> !feature.getUrl().contains("/homepage"))
                        .forEach(f::add)
        );
        req.setAttribute("feature", f);
        
        
      req.getRequestDispatcher("view/auth/homepage.jsp").forward(req, resp);
      
    }
   
   
    
}
