<cfcomponent>

	<cfset variables.fw = "" />

	<cffunction name="init">
		<cfargument name="fw" />

		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="default">
		
	</cffunction>


	<cffunction name="startLogin">
		<cfquery name="checkUser" datasource="fw1Test">
			select
				*
			from
				users u with (nolock)
			where
				1=1
				<cfif isDefined("rc.user")>
					and u.username='#rc.user#'
				<cfelse>
					and 1=2	
				</cfif>
				<cfif isDefined("rc.pass")>
					and u.password='#rc.pass#'
				<cfelse>
					and 1=2
				</cfif>
				and isActive = 1
		</cfquery>		

		<cfset rc.query = checkUser />
	</cffunction>

	<cffunction name="endLogin">
		<cfif rc.query.recordCount neq 0>
			<cfset session.auth.isLoggedIn = true />
			<cfset session.auth.fullname = rc.query.FirstName&" "&rc.query.LastName />
		<cfelse>
			<cfset rc.loginResult = "failed" />
			<cfset variables.fw.redirect(action='main.default',preserve='all') />
		</cfif>
	</cffunction>

	<cffunction name="logout">
		<cfset session.auth.isLoggedIn = false />
		<cfset session.auth.FullName = "Guest" />
		<cfset this.sessionTimeout = createTimeSpan(0, 0, 0, 1) />
		<cfset variables.fw.redirect('main.default') />
	</cffunction>

	<cffunction name="startConfirm">
		<cfquery name="activateUser" datasource="fw1Test">
			update users
			set isActive=1
			where useruid ='#rc.uid#'
		</cfquery>
	</cffunction>
</cfcomponent>
