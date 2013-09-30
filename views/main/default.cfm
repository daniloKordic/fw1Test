<cfoutput>


	<cfif session.auth.isLoggedIn>
		<h1>Welcome #session.auth.fullname#</h1>	
	<cfelse>
		<h1>Welcome #session.auth.fullName#</h1>

		<cfif isDefined("rc.loginResult") and rc.loginResult neq "">
			<h3 style="color:red;">User with these credentials does not exist in the database!</h3>
		</cfif>

		<form action="#buildUrl('main.login')#" method="post">
			username: <input type="text" name="user" value="" required placeholder="Enter a valid username" /><br/><br/>
			password: <input type="password" name="pass" value="" required placeholder="Enter a valid password" /><br/><br/>
			<input type="submit" value="Login">
		</form>
	</cfif>	

</cfoutput>