<cfcomponent>
	

	<cfset variables.fw = "" />

	<cffunction name="init">
		<cfargument name="fw" />

		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="setUserService" access="public" output="false" returntype="void">
		<cfargument name="userService" type="any" required="true" />
		<cfset variables.userService = arguments.userService />
	</cffunction>
	<cffunction name="getUserService" access="public" output="false" returntype="any">
		<cfreturn variables.userService />
	</cffunction>

	<cffunction name="before" access="public" returntype="void">
		<cfset setUserService(application.beanFactory.GetBean('userService')) />
	</cffunction>

	<cffunction name="default" access="public" returntype="void">
		<cfset var userService = getUserService() />
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
			<cfset session.auth.firstName = rc.query.firstname />
			<cfset session.auth.lastName = rc.query.lastname />
			<cfset session.auth.password = rc.query.password />
		<cfelse>
			<cfset rc.loginResult = "failed" />
			<cfset variables.fw.redirect(action='main.default',preserve='all') />
		</cfif>
	</cffunction>

	<cffunction name="startRegister">
		<cfif not isDefined("rc.username")><cfset rc.username=""/></cfif>
		<cfif not isDefined("rc.password")><cfset rc.password=""/></cfif>
		<cfif not isDefined("rc.firstname")><cfset rc.firstname=""/></cfif>
		<cfif not isDefined("rc.lastname")><cfset rc.lastname=""/></cfif>

		<cfquery name="checkIfExists" datasource="fw1Test">
			select
				count(u.FirstName) as idexists
			from
				Users u with (nolock)
			where
				u.username='#rc.username#'
				and u.password='#rc.password#'
		</cfquery>

		<cfif checkIfExists.idexists eq 0>
			<cfquery name="getUID" datasource="fw1Test">
				select newid() as UID
			</cfquery>
			<cfquery name="insertUser" datasource="fw1Test">
				insert into users
				values (
					'#getUID.UID#'
					,'#rc.firstName#'
					,'#rc.lastName#'
					,'#rc.username#'
					,'#rc.password#'
					,0
				)
			</cfquery>

			<cfset rc.info = "Registration successfull!You need to activate your account."/>
			<cfset rc.userUID = "#getUID.UID#"/>
		<cfelse>
			<cfset rc.info = "Registration failed!<br/>User with same username/password already exists!"/>	
			<cfset rc.userUID = ""/>		
		</cfif>
	</cffunction>

	<cffunction name="endRegister">
		<cfif rc.userUID neq "">
			<cfset variables.fw.redirect(action='users.registerStatus',preserve='all') />
		</cfif>		
	</cffunction>

	<cffunction name="startVerifyAccount">
		<cfif isDefined("rc.uid")>
			<cfset rc.userUID = rc.uid />
		<cfelse>
			<cfset rc.userUID=""/>	
		</cfif>
	</cffunction>

	<cffunction name="startConfirm">
		<cfquery name="activateUser" datasource="fw1Test">
			update users
			set isActive=1
			where useruid ='#rc.uid#'
		</cfquery>
	</cffunction>

	<cffunction name="startEdit">
		<cfif not session.auth.isLoggedIn>
			<cfset variables.fw.redirect('main.default') />
		<cfelse>
			
		</cfif>
	</cffunction>

</cfcomponent>