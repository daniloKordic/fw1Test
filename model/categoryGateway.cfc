<cfcomponent displayname="Category Gateway" output="false">
	
	<cfset variables.instance = {} />

	<cffunction name="init" output="false">
		<cfargument name="settings" required="true" type="any" />

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
				c.*
			from
				Categories c with (nolock)
		</cfquery>

		<cfreturn qry />
	</cffunction>

	<cffunction name="getByKey" access="public" output="false" returntype="Any">
		<cfargument name="uid" required="true" type="any" />

		<cfset var qry=""/>
		<cfset var category = createObject("component","model.category").init() />

		<cfif arguments.uid neq "">
			<cfquery name="qry" datasource="#getDSN()#">
				select
					c.*
				from
					Categories c with (nolock)
				where
					productCategoryUID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.uid#" />
			</cfquery>
			<cfif qry.recordCount eq 1>
				<cfset category.setupCategory(
					 CategoryUID = qry.CategoryUID
					,CategoryName=qry.CategoryName
					,CategoryDescription=qry.CategoryDescription
					,ParentUID=qry.ParentUID
					,DateCreated=qry.DateCreated
					,DateUpdated=qry.DateUpdated
					) />
			</cfif>
		</cfif>

		<cfreturn category />
	</cffunction>

</cfcomponent>