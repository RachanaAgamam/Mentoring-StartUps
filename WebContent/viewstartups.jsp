<%@page import="com.voidmain.pojo.StartupRequest"%>
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
		<h1>View Startups</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			
			<tr>
				<th>Id</th>
				<th>Mentor id</th>
				<th>Idea</th>
				<th>Description</th>
				<th>Status</th>
				<th>Update Mentor</th>
			</tr>
			
			<%
				if(role.equals("user"))
				{
			%>
					<%
						for (StartupRequest startupRequest : HibernateDAO.getStartupRequests()) {
							
							if(startupRequest.getUserid().equals(username))
							{
					%>
							<tr>
								<td><%=startupRequest.getId()%></td>
								<td><%=startupRequest.getMentorid()%></td>
								<td><%=startupRequest.getIdea()%></td>
								<td><%=startupRequest.getDescription()%></td>
								<td><%=startupRequest.getStatus()%></td>
								<td><a href="updatementor.jsp?startupRequestId=<%=startupRequest.getId()%>">update mentor</a></td>
					<%
							}
						}
					%>
			<%
				}
			%>
			
		</table>
		
	</div>
</div>
<%@include file="footer.jsp"%>