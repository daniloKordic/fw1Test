<cfcomponent extends="framework">
	<cfset this.sessionmanagement = true />
	<cfset this.sessiontimeout = createTimeSpan(0, 0, 0, 30) />

	<cfset variables.framework.reloadApplicationOnEveryRequest = true />

	<cffunction name="setupRequest">
		<cfset controller('security.checkUser') />
	</cffunction>

	<cffunction name="setupSession">
		<cfset controller('security.session') />
	</cffunction>
	
</cfcomponent>