<!DOCTYPE HTML>
<html>

<head>
<title>BizNest</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="#">BizNest-Entrepreneur Support Hub</a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");
						String field = (String) request.getSession().getAttribute( "field");

						if (role.equals("mentor")) {
					%>
						<li><a href="viewquerys.jsp">View Querys</a></li>
						<li><a href="postarticle.jsp">Post Article</a></li>
						<li><a href="viewarticles.jsp">View Articles</a></li>
						<li><a href="viewstartuprequests.jsp">View Requests</a></li>
					<%
						}
					%>
					<%
						if (role.equals("user")) {
					%>
						<li><a href="viewmentors.jsp">View My Mentor's</a></li>
						<li><a href="createstartup.jsp">Create Startup</a></li>
						<li><a href="viewstartups.jsp">View Startups</a></li>
						<li><a href="viewquerys.jsp">Querys</a></li>
						<li><a href="viewarticles.jsp">Articles</a></li>
						<li><a href="viewmentorsbyuser.jsp">Mentor's</a></li>
					
					<%
						}
					%>
					
					<%
						if (role.equals("admin")) {
					%>
						<li><a href="viewmentors.jsp">View Mentors</a></li>
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">