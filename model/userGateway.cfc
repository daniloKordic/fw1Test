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

	<cffunction name="getGrid" access="public" output="false" returntype="query">
		<cfargument name="grid" type="any" required="true" />
		<cfset var qry = ""/>
		<cfquery name="qry" datasource="#getDSN()#">
			select
				u.*
			from
				Users u with (nolock)
		</cfquery>

		<cfreturn qry />
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
		
		<cfreturn qry />
	</cffunction>

	<cffunction name="getByKey" access="public" output="false" returntype="Any">
		<cfargument name="uid" required="true" type="any" />

		<cfset var qry=""/>
		<cfset var user = createObject("component","model.user").init() />

		<cfif arguments.uid neq "">
			<cfquery name="qry" datasource="#getDSN()#">
				select
					u.*
				from
					Users u with (nolock)
				where
					userUID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.uid#" />
			</cfquery>
			<cfif qry.recordCount eq 1>
				<cfset user.setupUser(
					UID = qry.userUID
					,FirstName=qry.FirstName
					,LastName=qry.LastName
					,email=qry.email
					,username=qry.username
					,password=qry.password
					,isActive=qry.isActive
					,TypeID=qry.TypeID
					) />
			</cfif>
		</cfif>

		<cfreturn user />
	</cffunction>

	<!--- CREATE --->
	<cffunction name="create" access="public" output="false" returntype="string">
		<cfargument name="user" required="true" type="any" />
		<cfset var qry=""/>
		<cfquery name="qry" datasource="#getDSN()#">
			select newid() as newUID
		</cfquery>
		<cfset var uid = qry.newUID/>

		<cfquery name="qry" datasource="#getDSN()#">
			insert into users (
				 userUID
				,FirstName
				,LastName
				,email
				,username
				,password
				,isActive
				,typeID
			) values(
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#uid#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getFirstname()#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getLastName()#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getEmail()#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getUsername()#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getPassword()#" />
				,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.user.getIsActive()#" />
				,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.user.getTypeID()#" />
			)
		</cfquery>

		<cfreturn uid />
	</cffunction>

	<!--- UPDATE --->
	<cffunction name="update" access="public" output="false" returntype="string">
		<cfargument name="user" required="true" type="any" />
		<cfset var qry=""/>
		<cfset var uid = arguments.user.getUID() />
		<cfquery name="qry" datasource="#getDSN()#">
			UPDATE Users SET
			 FirstName=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getFirstName()#" />
			,Lastname=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getLastName()#" />
			,email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getEmail()#" />
			,username=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getUsername()#" />
			,password=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getPassword()#" />
			WHERE UserUID=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getUID()#" />
		</cfquery>

		<cfreturn uid />
	</cffunction>

	<!--- SAVE --->
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

	<!--- DELETE --->
	<cffunction name="delete" output="false" access="public" returntype="numeric">
		<cfargument name="user" required="true" type="any" />
		<cfset qry=""/>

		<cfquery name="qry" datasource="#getDSN()#">
			delete from users where useruid=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user.getUID()#" />
		</cfquery>

		<cfreturn 1 />
	</cffunction>

</cfcomponent>