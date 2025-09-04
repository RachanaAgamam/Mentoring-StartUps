<%@page import="com.voidmain.pojo.StartupRequest"%>
<%@page import="com.voidmain.pojo.Mentor"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>

<div id="site_content">
	<div id="content">
		<!-- insert the page content here -->

		<%
			String status = request.getParameter("status");

			if (status != null) {
		%>
		<h1><%=status%></h1>
		<%
			} else {
		%>
		<h1>View Mentors</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Company Name</th>
				<th>Experience</th>
				<th>Field of Working</th>
			</tr>
			
			<%
				if(role.equals("user"))
				{
			%>
					<%
						for (Mentor mentor : HibernateDAO.getMentors()) 
						{
					%>
							<tr>
								<td><%=mentor.getName()%></td>
								<td><%=mentor.getEmail()%></td>
								<td><%=mentor.getMobile()%></td>
								<td><%=mentor.getAddress()%></td>
								<td><%=mentor.getCompany()%></td>
								<td><%=mentor.getExperience()%></td>
								<td><%=mentor.getFieldofworking()%></td>
							</tr>
					<%
						}
					%>
			<%
				}
			%>
			
			
		</table>
		
	</div>
</div>
<%@include file="footer.jsp"%>