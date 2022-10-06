package com.youngpopeugene.web_lab2.servlets;

import com.youngpopeugene.web_lab2.model.Shot;
import com.youngpopeugene.web_lab2.model.ShotCollectionManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AreaCheckServlet", value = "/check")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double x = Double.parseDouble(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        double r = Double.parseDouble(req.getParameter("r"));
        Boolean status = isHit(x, y, r);
        resp.getWriter().println(status);
        ShotCollectionManager.add(new Shot(x, y, r, status));
        getServletContext().setAttribute("collection", ShotCollectionManager.getCollection());
    }

    private boolean isHit(double x, double y, double r){
        return isCircleZone(x, y, r) || isTriangleZone(x, y, r) || isRectangleZone(x, y, r);
    }
    private boolean isRectangleZone(double x, double y, double r){
        return (x>=0) && (y<=0) && (x<=r) && (y>=(-1)*r);
    }
    private boolean isCircleZone(double x, double y, double r){
        return (x*x + y*y <= r*r) && (x>=0) && (y>=0);
    }
    private boolean isTriangleZone(double x, double y, double r){
        return (x<=0) && (y<=0) && (x>=(-1)*r/2) && (y>=(-1)*r);
    }
}
