<cfoutput>

	<script type="text/javascript">
		function register() {
			window.location="index.cfm?action=users.register";
		}
	</script>

	<cfif session.auth.isLoggedIn>
		<h1>Welcome #session.auth.firstName# #session.auth.lastName#</h1>	
	<cfelse>
		<h1>Welcome #session.auth.firstName# #session.auth.lastName#</h1>	

		<cfif isDefined("rc.loginResult") and rc.loginResult eq "failed">
			<h3 style="color:red;">User with these credentials does not exist in the database!</h3>
		</cfif>

		<form action="#buildUrl('users.login')#" method="post">
			username: <input type="text" name="user" value="" required placeholder="Enter a valid username" /><br/><br/>
			password: <input type="password" name="pass" value="" required placeholder="Enter a valid password" /><br/><br/>
			<input type="submit" value="Login">
			<input type="button" value="Register" onclick="register()"/>
		</form>
	</cfif>	

	
</cfoutput>