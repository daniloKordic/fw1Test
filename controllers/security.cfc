<cfcomponent>
	<cffunction name="checkUser">
		<cfif session.auth.isLoggedIn>
			<cfset this.sessionTimeout = createTimeSpan(0, 0, 0, 30) />
		</cfif>
	</cffunction>

	<cffunction name="session">
		<cfargument name="rc" />
		
		<cfset session.auth = {} />
		<cfset session.auth.isLoggedIn = false />
		<cfset session.auth.fullname = "Guest" />
	</cffunction>
</cfcomponent>