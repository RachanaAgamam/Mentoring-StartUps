package com.voidmain.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.voidmain.dao.HibernateTemplate;
import com.voidmain.pojo.Mentor;

@WebServlet("/VoidmainServlet")
public class VoidmainServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	HttpServletRequest request;
	HttpServletResponse response;

	Object obj=null;
	String redirect=null;
	String type;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.request=request;
		this.response=response;

		try {
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if(isMultipart) {
				
				Object obj=new Mentor();
				
				System.out.println("in multipart request");
				
				Map<Object,List<String>> map=HttpRequestParser.parseMultiPartRequest(request,obj);
				
				List<String> list=map.get(obj);
				
				Mentor mentor=(Mentor)obj;
				mentor.setProof(list.get(0));
				
				if(HibernateTemplate.addObject(mentor)==1)
				{
					System.out.println("if success");
					response.sendRedirect("mentorregistration.jsp?status=success");
				}
				else
				{
					System.out.println("else failed");
					response.sendRedirect("mentorregistration.jsp?status=failed");
				}
			}
			else
			{
				type=request.getParameter("type");
				redirect=request.getParameter("redirect");
					
				if(type!=null && redirect!=null)
				{
					System.out.println("valid request");
					
					obj=Class.forName(type).newInstance();
					
					System.out.println("not a multiparty");
					
					Object object=HttpRequestParser.parseRequest(request, obj);

					if(HibernateTemplate.addObject(object)==1)
					{
						response.sendRedirect(redirect+"?status=success");
					}
					else
					{
						response.sendRedirect(redirect+"?status=failed");
					}
				}
				else
				{
					System.out.println("in valid request");
				}
				
			}
			
			//======================================================

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
