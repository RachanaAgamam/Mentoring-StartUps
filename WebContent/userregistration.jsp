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
	
<script type="text/javascript">
	
	function validate()
	{
		var name=document.appform.name.value;
		var email=document.appform.email.value;
		var mobile=document.appform.mobile.value;
		var address=document.appform.address.value;
		var password=document.appform.password.value;
		
		if(name=="" || name==null)
		{
			alert("please enter name");
			return false;
		}
		if(email=="" || email==null)
		{
			alert("please enter email");
			return false;
		}
		if(mobile=="" || mobile==null || isNaN(mobile) || mobile.length!=10)
		{
			alert("please enter valid mobile");
			return false;
		}
		if(address=="" || address==null)
		{
			alert("please enter address");
			return false;
		}
		if(password=="" || password==null)
		{
			alert("please enter password");
			return false;
		}
	}
	
</script>

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
				
					<li><a href="index.jsp">Login</a></li>
					<li><a href="userregistration.jsp">User Registration</a></li>
					<li><a href="mentorregistration.jsp">Mentor Registration</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
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
				<h1>Register Here</h1>
				<%
					}
				%>

				<form action="VoidmainServlet" method="post" name="appform">

					<input type="hidden" name="type" value="com.voidmain.pojo.User">
					<input type="hidden" name="redirect" value="userregistration.jsp">

					<div class="form_settings">
						
						<p>
							<span>Name</span><input class="contact" type="text" name="name"
								value="" />
						</p>
						<p>
							<span>User Name</span><input class="contact" type="text" name="username"
								value="" />
						</p>
						<p>
							<span>Password</span><input class="contact" type="password"
								name="password" value="" />
						</p>
						<p>
							<span>Mobile</span><input class="contact" type="text"
								name="mobile" value="" />
						</p>
						<p>
							<span>Email Address</span><input class="contact" type="text"
								name="email" value="" />
						</p>
						<p>
							<span>Address</span>
							<textarea class="contact" name="address"></textarea>

						</p>
						<p>
							<span>Select Interested Area</span> <select name="fieldofinterest">
								<option value="electronics">Electronics</option>
								<option value="computerscience">Computer Science</option>
							</select>
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Register" onclick="return validate()" />
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
