<cfoutput>

	<h1>Welcome #session.auth.fullName#</h1>
	<a href="#buildUrl('main.logout')#">Log out</a>

	<cfdump var="#rc#"/>
	<cfdump var="#session#"/>
</cfoutput>