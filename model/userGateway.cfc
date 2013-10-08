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

	<cffunction name="getByFilter" access="public" output="false" returntype="query">
		<cfargument name="filter" required="false" type="struct" default="#structNew()#" />
		<cfset var qry = ""/>

		<cfquery name="qry" datasource="#getDSN()#">
			select
				*
			from
				Users
			where
				1=1
				<cfif structKeyExists(arguments.filter,"uid") and len(arguments.filter.uid)>
					and userUID
					<cfif structKeyExists(arguments.filter,"uidSign") and len(arguments.filter.uidSign)>
						#arguments.filter.uidSign#
					<cfelse>
						=
					</cfif>
					'#arguments.filter.uid#'
				</cfif>
				<cfif structKeyExists(arguments.filter,"email") and len(arguments.filter.email)>
					and email = '#arguments.filter.email#'
				</cfif>
		</cfquery>
		<cfdump var="#qry#" output="C:\qewrtt.txt"/>
		<cfreturn qry />
	</cffunction>

	<cffunction name="getByKey" access="public" output="false" returntype="Any">
		<cfargument name="userUID" required="true" type="string" />

		<cfset var qry=""/>
		<cfset var user = createObject("component","model.user").init() />

		<cfif arguments.userUID neq "">
			<cfquery name="qry" datasource="#getDSN()#">
				select
					*
				from
					Users
				where
					userUID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.userUID#" />
			</cfquery>
			<cfif qry.recordCount eq 1>
				<cfset user.setupUser(
					UID = qry.userUID
					,FirstName=qry.FirstName
					,LastName=qry.LastName
					,email=qry.email
					,password=qry.password
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

	<cffunction name="save" access="public" output="false" returntype="string">
		<cfargument name="user" required="true" type="any" />
		<cfset var uid=""/>

		<cfif len(arguments.user.getUID())>
			<cfset var uid = update(user=arguments.user) />
		<cfelse>
			<cfset var uid = create(user=arguments.user) />
		</cfif>

		<cfreturn uid />
	</cffunction>

	<cffunction name="create" access="public" output="false" returntype="String">
		<cfargument name="user" required="true" type="any" />
		<cfset var qry=""/>
		<cfquery name="getUID" datasource="#getDSN()#">
			select newid() as newuid
		</cfquery>
		<cfset var uid=getUID.newuid />
		<cfquery name="insertUser" datasource="#getDSN()#">
			insert into Users (
				userUID
				,FirstName
				,LastName
				,email
				,password
				,isActive
				,typeID
			) values (
				<cfqueryparam value="#uid#" cfsqltype="cf_sql_varchar" />
				,<cfqueryparam value="#arguments.user.getFirstName()#" cfsqltype="cf_sql_varchar" />
				,<cfqueryparam value="#arguments.user.getLastName()#" cfsqltype="cf_sql_varchar" />
				,<cfqueryparam value="#arguments.user.getEmail()#" cfsqltype="cf_sql_varchar" />
				,<cfqueryparam value="#arguments.user.getPassword()#" cfsqltype="cf_sql_varchar" />
				,1
				,2
			)
		</cfquery>

		<cfreturn uid />
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="string">
		<cfargument name="user" required="false" type="any" />

		<cfset var qry=""/>
		<cfset uid = arguments.user.getUID() />

		<cfquery name="qry" datasource="#getDSN()#">
			update users set
				FirstName=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getFirstName()#" />
				,LastName=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getLastName()#" />
				,email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getEmail()#" />
				,password=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getPassword()#" />
			where
				userUID=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getUID()#" />
		</cfquery>
		
		<cfreturn uid />
	</cffunction>
</cfcomponent>