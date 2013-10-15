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

</cfoutput>