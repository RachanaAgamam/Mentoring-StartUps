<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Mentor"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.pojo.StartupRequest"%>
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
	<h1>Post Query</h1>
	<%
		}
	%>

	<form action="updatementor.jsp">

		<%
			String id = request.getParameter("startupRequestId");
			
			if(id!=null)
			{
		%>

		<input type="hidden" name="type" value="com.voidmain.pojo.StartupRequest"> 
		<input type="hidden" name="redirect" value="viewstartups.jsp">
		
		<input type="hidden" name="id" value="<%=id%>">

		<div class="form_settings">
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
					name="contact_submitted" value="Updatet"
					onclick="return validate()" />
			</p>
		</div>
	</form>
	
	<%
			}
	%>

	<%
		String mentorid = request.getParameter("mentorid");
		String sid = request.getParameter("id");

		if (mentorid != null && sid != null) {

			StartupRequest srequest = HibernateDAO.getStartupRequestById(Integer.parseInt(sid));
			
			srequest.setStatus("no");
			srequest.setMentorid(mentorid);

			if (HibernateTemplate.updateObject(srequest) == 1) {
				response.sendRedirect("viewstartups.jsp?status=success");
			} else {
				response.sendRedirect("viewstartups.jsp?status=failed");
			}
		}
	%>

</div>
<%@include file="footer.jsp"%>