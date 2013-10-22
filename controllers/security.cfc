<cfcomponent>

	<cffunction name="init">
		<cfargument name="fw" type="any" required="false" />
		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="authorize">
		<cfargument name="rc" type="any" required="true" />
		<!--- <cfif not session.auth.isLoggedIn and 	not listFindNoCase('main', variables.fw.getSection() ) and
															not listFindNoCase('register', variables.fw.getSection()) and
															not listFindNoCase('login', variables.fw.getSection()) and
															not listFindNoCase('main.error', variables.fw.getFullyQualifiedAction() )>
			<!--- <cfset this.sessionTimeout = createTimeSpan(0, 0, 0, 30) />
		<cfelse> --->
			<cfset variables.fw.redirect('main') />
		</cfif> --->
	</cffunction>

	<cffunction name="session">
		<cfargument name="rc" />
		
		<cfset session.auth = {} />
		<cfset session.auth.isLoggedIn = false />
		<cfset session.auth.fullName = "Guest" />
		<cfset session.auth.TypeID = 3 />
	</cffunction>
</cfcomponent>