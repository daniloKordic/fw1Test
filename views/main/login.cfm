<cfoutput>

	<h1>Welcome #session.auth.firstName# #session.auth.lastName#</h1>
	<a href="#buildUrl('main.logout')#">Log out</a>

</cfoutput>