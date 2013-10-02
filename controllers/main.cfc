<cfcomponent>

	<cfset variables.fw = "" />

	<cffunction name="init">
		<cfargument name="fw" />

		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="default">
		
	</cffunction>

	<cffunction name="logout">
		<cfset session.auth.isLoggedIn = false />
		<cfset session.auth.firstName = "Guest" />
		<cfset session.auth.lastName = "" />
		<cfset this.sessionTimeout = createTimeSpan(0, 0, 0, 1) />
		<cfset variables.fw.redirect('main.default') />
	</cffunction>
	
</cfcomponent>
