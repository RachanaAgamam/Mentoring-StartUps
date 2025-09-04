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
		<h1>View Requests</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			
			<tr>
				<th>User ID</th>
				<th>IDEA</th>
				<th>Description</th>
				<th>Status</th>
				<th>Accept/Reject</th>
			</tr>
			
			<%
				if(role.equals("mentor"))
				{
			%>
					<%
						for (StartupRequest startupRequest : HibernateDAO.getStartupRequests()) {
							
							if(startupRequest.getMentorid().equals(username))
							{
					%>
			
					
							<tr>
								<td><%=startupRequest.getUserid()%></td>
								<td><%=startupRequest.getIdea()%></td>
								<td><%=startupRequest.getDescription()%></td>
								<td><%=startupRequest.getStatus()%></td>
								<%
									if (startupRequest.getStatus().equals("no")) {
								%>
											<td><a href="viewstartuprequests.jsp?startupRequest=<%=startupRequest.getId()%>&status=yes">Accept</a></td>
								<%
									} else if (startupRequest.getStatus().equals("yes")) {
								%>
										<td><a href="viewstartuprequests.jsp?startupRequest=<%=startupRequest.getId()%>&status=no">Reject</a></td>
								<%
									}
				
								%>
					<%
							}
						}
					%>
			<%
				}
			%>
			
			<%
				String startupRequest = request.getParameter("startupRequest");
				String sta = request.getParameter("status");
	
				if (startupRequest != null && sta != null) {
					
					StartupRequest srequest = HibernateDAO.getStartupRequestById(Integer.parseInt(startupRequest));
					srequest.setStatus(sta);
					
					if (HibernateTemplate.updateObject(srequest) == 1) {
						response.sendRedirect("viewstartuprequests.jsp?status=success");
					} else {
						response.sendRedirect("viewstartuprequests.jsp?status=failed");
					}
				}
			%>
			
		</table>
		
	</div>
</div>
<%@include file="footer.jsp"%>