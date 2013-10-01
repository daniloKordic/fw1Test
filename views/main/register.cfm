<cfoutput>

	<script type="text/javascript">
		function register() {
			var error = "";

			if ($("##firstName").val() == "") { error = error + "First Name is required.\n"; }
			if ($("##lastName").val() =="") { error = error + "Last Name is required.\n"; }
			if ($("##username").val() == "") { error = error + "Username is required.\n"; }
			if ($("##password").val() == "") { error = error + "Password is required.\n"; }

			if (error == "") {
				$("##userRegister").submit();
			} else {
				alert(error);
			}
		}
		function cancel() {
			$("##firstName").val("");
			$("##lastName").val("");
			$("##username").val("");
			$("##password").val("");
		}
	</script>

	<h1>Register new user</h1>
	<form action="#buildUrl('users.register')#" method="post" id="userRegister">
		<input type="text" id="firstName" name="firstName" value="" required placeholder="Enter first name"/><br/><br/>
		<input type="text" id="lastName" name="lastName" value="" required placeholder="Enter last name"/><br/><br/>
		<input type="text" id="username" name="username" value="" required placeholder="Enter username"/></br><br/>
		<input type="password" id="password" name="password" value="" required placeholder="Enter password"/><br/><br/>
		<input type="button" value="Register" onclick="register()"/>
		<input type="button" value="Cancel" onclick="cancel()" />
	</form>

	
</cfoutput>