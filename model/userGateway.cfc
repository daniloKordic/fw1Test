<cfcomponent displayname="User Gateway" output="false">
	
	<cfset variables.instance = {} />

	<cffunction name="init" output="false">
		<cfargument name="settings" required="true" type="any">

		<cfset variables.instance.config = arguments.settings.getConfig() />
		<cfset variables.instance.dsn = variables.instance.config.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="getDSN" access="private" output="false" returntype="String">
		<cfreturn variables.instance.dsn />
	</cffunction>

	<cffunction name="getByEmail" access="public" output="false" returntype="Any">
		<cfargument name="email" required="true" type="string" />
		<cfset var qry = "" />
		<cfset var user = createObject("component","model.user").init() />
		<cfif arguments.email neq "">
			<cfquery name="qry" datasource="#getDSN()#">
				select
					u.userUID
					,u.FirstName
					,u.LastName
					,u.email
					,u.password
					,u.isActive
				from
					Users u
				where
					u.email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfif qry.recordCount eq 1>
				<cfset user.setupUser(
					UID = qry.userUID
					,FirstName = qry.FirstName
					,LastName = qry.LastName
					,email = qry.email
					,password = qry.password
					,isActive = qry.isActive
				) />
			</cfif>
		</cfif>
		<cfreturn user />
	</cffunction>

	<cffunction name="getAll" access="public" output="false" returntype="Query">
		<cfset var qryUsers = ""/>

		<cfquery name="qryUsers" datasource="#getDSN()#">
			select
				u.userUID
				,u.FirstName
				,u.LastName
				,u.email
				,u.password
				,u.isActive
			from
				Users u
			order by
				u.FirstName
		</cfquery>

		<cfreturn qryUsers />
	</cffunction>

</cfcomponent>