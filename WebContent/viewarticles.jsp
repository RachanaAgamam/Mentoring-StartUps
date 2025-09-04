<%@page import="com.voidmain.pojo.Article"%>
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
		<h1>View Articles</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>ID</th>
				<th>Posted By</th>
				<th>Date</th>
				<th>Title</th>
				<th>Description</th>
				<th>Video</th>
				<th>Delete</th>
			</tr>

			<%
				for (Article article : HibernateDAO.getArticles()) {
				
					if(field.equals(HibernateDAO.getMentorById(article.getPostedBy()).getFieldofworking()))
					{
					
			%>
						<tr>
							<td><%=article.getId()%></td>
							<td><%=article.getPostedBy()%></td>
							<td><%=article.getPostDate()%></td>
							<td><%=article.getTitle()%></td>
							<td><%=article.getDescription()%></td>
							<td><a href="<%=article.getVideoLink()%>" target="_blank">watch</a></td>
						<%
							if(article.getPostedBy().equals(username))
							{
						%>
							<td> <a href="viewarticles.jsp?id=<%=article.getId()%>">delete</a></td>
						<%
							}
							else
							{
						%>
								<td>No Access </td>
						<%		
							}
						%>
						
						</tr>
			<%
					}
				}
			%>
				
		</table>
		
		<%
			String id=request.getParameter("id");
		
			if(id!=null)
			{
				if(HibernateTemplate.deleteObject(Article.class,Integer.parseInt(id))==1)
				{
					response.sendRedirect("viewarticles.jsp?status=success");
				}
				else
				{
					response.sendRedirect("viewarticles.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>