<cfoutput>
	#rc.info#
	<br/>
	<cfif rc.userUID neq "">
		<a href="#buildUrl(action='main.confirm',queryString='uid=#rc.userUID#')#">Activate your account</a>
		<br/>		
	</cfif>	
	<a href="#buildUrl('main.default')#">Goto login page</a>
	
</cfoutput>