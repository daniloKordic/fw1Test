<cfoutput>

	<cfif rc.user.getUID() neq "">
		#rc.result.message#<br/>
		<a href="#buildUrl('login')#">Go to login page!</a>	
	</cfif>
	
	<cfdump var="#rc#"/>
	<br/><br/>
	<cfdump var="#session#" />

</cfoutput>