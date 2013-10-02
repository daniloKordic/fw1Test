<cfoutput>
	
	<cfif rc.userUID neq "">
		<a href="#buildUrl(action='users.confirm',queryString='uid=#rc.userUID#')#">Activate your account</a>
		<br/>
	</cfif>	
	<a href="#buildUrl('main.default')#">Goto login page</a>
	
</cfoutput>