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
				
				<%
					if (role.equals("user")) {
				%>
						<th>Post Query</th>
				<%
					}
				%>
				<%
					if (role.equals("admin")) {
				%>
					<th>Account Status</th>
					<th>Update Status</th>
					<th>Download Proof</th>
				<%
					}
				%>
			</tr>
			
			
			<%
				if(role.equals("user"))
				{
			%>
					<%
						for (StartupRequest startupRequest : HibernateDAO.getStartupRequests()) {
								
							if(startupRequest.getUserid().equals(username) && startupRequest.getStatus().equals("yes"))
							{
								Mentor mentor=HibernateDAO.getMentorById(startupRequest.getMentorid());
					%>
									<tr>
										<td><%=mentor.getName()%></td>
										<td><%=mentor.getEmail()%></td>
										<td><%=mentor.getMobile()%></td>
										<td><%=mentor.getAddress()%></td>
										<td><%=mentor.getCompany()%></td>
										<td><%=mentor.getExperience()%></td>
										<td><%=mentor.getFieldofworking()%></td>
										<td> <a href="postquery.jsp?mentor=<%=mentor.getUserName()%>">Post Query</a></td>
									</tr>
		
					<%
							}
						}
					%>
			<%
				}
			%>
			
			<%
				if(role.equals("admin"))
				{
			%>
					<%
						for (Mentor mentor : HibernateDAO.getMentors()) {
					%>
			
					
							<tr>
								<td><%=mentor.getName()%></td>
								<td><%=mentor.getEmail()%></td>
								<td><%=mentor.getMobile()%></td>
								<td><%=mentor.getAddress()%></td>
								<td><%=mentor.getCompany()%></td>
								<td><%=mentor.getExperience()%></td>
								<td><%=mentor.getFieldofworking()%></td>
								<td><%=mentor.getStatus()%></td>
								<%
									if (mentor.getStatus().equals("no")) {
								%>
											<td><a href="viewmentors.jsp?mentor=<%=mentor.getUserName()%>&status=yes">Yes</a></td>
								<%
									} else if (mentor.getStatus().equals("yes")) {
								%>
										<td><a href="viewmentors.jsp?mentor=<%=mentor.getUserName()%>&status=no">No</a></td>
								<%
									}
				
								%>
								
								<td> <a href="http://localhost:2525/MentoringStartup/documents/<%=mentor.getProof()%>" download>Download</a></td>
					<%
						}
					%>
			<%
				}
			%>
			
			<%
				String mentor = request.getParameter("mentor");
				String sta = request.getParameter("status");
	
				if (mentor != null && sta != null) {
					
					Mentor men = HibernateDAO.getMentorById(mentor);
					men.setStatus(sta);
					
					if (HibernateTemplate.updateObject(men) == 1) {
						response.sendRedirect("viewmentors.jsp?status=success");
					} else {
						response.sendRedirect("viewmentors.jsp?status=failed");
					}
				}
			%>
			
		</table>
		
	</div>
</div>
<%@include file="footer.jsp"%>