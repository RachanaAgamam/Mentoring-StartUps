<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.Mentor"%>
<%@page import="java.util.Date"%>
<%@include file="header.jsp"%>
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
	<h1>Create StartUp Request</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform">

		<input type="hidden" name="type" value="com.voidmain.pojo.StartupRequest">
		<input type="hidden" name="redirect" value="viewstartups.jsp">

		<input type="hidden" name="userid" value="<%=username%>"> <input
			type="hidden" name="status" value="no">

		<div class="form_settings">

			<p>
				<span>Idea</span><input class="contact" type="text" name="idea"
					value="" />
			</p>
			<p>
				<span>Description</span>
				<textarea class="contact" name="description"></textarea>

			</p>
			<p>
				<span>Select Mentor</span> <select name="mentorid">
					<%
						for (Mentor mentor : HibernateDAO.getMentors()) {

							if (mentor.getFieldofworking().equals(field)) {
					%>
							<option value="<%=mentor.getUserName()%>"><%=mentor.getUserName()%></option>
					<%
							}
						}
					%>
				</select>
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Create" onclick="return validate()" />
			</p>
		</div>

	</form>
</div>
<%@include file="footer.jsp"%>