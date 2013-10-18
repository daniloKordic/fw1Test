<cfoutput>

	<cfparam name="rc.pageTitle" default="Product Management" />
	<cfparam name="rc.message" default="#arrayNew(1)#"/>

	<!DOCTYPE HTML>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>#rc.pageTitle#</title>

		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" type="text/css" href="assets/css/datepicker.css"/>
		<link rel="stylesheet" type="text/css" href="assets/css/jquery-ui-1.10.2.custom.css"/>
		<link href="assets/css/style.css" rel="stylesheet" media="screen">

		<script type="text/javascript" src="assets/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="assets/js/jquery.validate.js"></script>
		<script src="assets/js/jquery-ui-1.10.2.custom.js"></script>
		<script language="javascript" src="assets/js/bootstrap-datepicker.js"></script>
		<script src="assets/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/global.js"></script>
	</head>
	<body>
		<div class="navbar navbar-inverse nav">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		            </a>
		            <a class="brand" href="/">CMS</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
	                  <li class="divider-vertical"></li>
	                  <li><a href="#buildUrl('main')#"><i class="icon-home icon-white"></i> Home</a></li>
	              </ul>
						<ul class="nav pull-right">

							<cfif not session.auth.isLoggedIn>
								<li><a href="#buildUrl('register')#">Sign Up</a></li>
			               <li class="divider-vertical"></li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="##" data-toggle="dropdown">Sign In <strong class="caret"></strong></a>
									<div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
										<form method="post" action="#buildURL('login.login')#" accept-charset="UTF-8">
											<input style="margin-bottom: 15px;" type="text" placeholder="E-mail" id="email" name="email">
											<input style="margin-bottom: 15px;" type="password" placeholder="Password" id="password" name="password">									
											<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
											<!--- <label style="text-align:center;margin-top:5px">or</label>
											<input class="btn btn-primary btn-block" type="button" id="sign-in-google" value="Sign In with Google">
											<input class="btn btn-primary btn-block" type="button" id="sign-in-twitter" value="Sign In with Twitter"> --->
										</form>
									</div>
								</li>
							<cfelse>
	                    <li class="dropdown"><a href="##" class="dropdown-toggle" data-toggle="dropdown">Welcome, #session.auth.fullname# <b class="caret"></b></a>
	                        <ul class="dropdown-menu">
	                            <li><a href="/user/preferences"><i class="icon-cog"></i> Preferences</a></li>
	                            <li><a href="/help/support"><i class="icon-envelope"></i> Contact Support</a></li>
	                            <li class="divider"></li>
	                            <li><a href="#buildUrl('login.logout')#"><i class="icon-off"></i> Logout</a></li>
	                        </ul>
	                    </li>
							</cfif>							
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid -->
			</div>
			<!--/.navbar-inner -->
		</div>
		<!--/.navbar -->
		<div class="container">		
			<div class="row">
				#body#
			</div>
			<hr>
			<footer>
				<p>&copy; danilokordic.com 2013</p>
			</footer>
		</div>		
	</body>
	</html>

	<script type="text/javascript">
		$(document).ready(function(){
			setTimeout(function(){ 
				$(".expired").hide('slow', function(){ $(".expired").remove();});
			}, 1500 ); 

			//Handles menu drop down
			$('.dropdown-menu').find('form').click(function (e) {
				e.stopPropagation();
			});
		});
	</script>

</cfoutput>