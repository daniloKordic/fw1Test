<cfcomponent>
	

	<cfset variables.fw = "" />

	<cffunction name="init">
		<cfargument name="fw" />

		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="startRegister">
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

</cfcomponent>