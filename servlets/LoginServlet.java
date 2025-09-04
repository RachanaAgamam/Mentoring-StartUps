package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.HibernateDAO;
import com.voidmain.pojo.Mentor;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		String type=request.getParameter("type").trim();
		
		boolean isValidUser=false;
		String field="";
		
		if(username.equals("admin") && password.equals("admin"))
		{
			request.getSession().setAttribute("username",username.toLowerCase());
			request.getSession().setAttribute("role","admin");
			response.sendRedirect("home.jsp");
		}
		else
		{
			if(type.equals("mentor"))
			{
				isValidUser=HibernateDAO.isValidMentor(username, password);
				
				if(isValidUser)
				{
					field=HibernateDAO.getMentorById(username).getFieldofworking();
				}
			}
			else if(type.equals("user"))
			{
				isValidUser=HibernateDAO.isValidUser(username, password);
				
				if(isValidUser)
				{
					field=HibernateDAO.getUserById(username).getFieldofinterest();
				}
			}
			
			if(isValidUser)
			{
				request.getSession().setAttribute("username",username.toLowerCase());
				request.getSession().setAttribute("role",type);
				request.getSession().setAttribute("field",field);
				response.sendRedirect("home.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp?status=Invalid Username and Password/Verification Pending");
			}
		}
	}
}
