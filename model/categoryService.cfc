<cfcomponent displayname="Category Service" output="false">
	
	<cffunction name="init" output="false">
		<cfargument name="categoryGateway" required="true" type="component"/>
		<cfset variables.instance.categoryGateway=arguments.categoryGateway />
		<cfreturn this />
	</cffunction>

	<cffunction name="getCategoryGateway" access="public" output="false">
		<cfreturn variables.instance.categoryGateway />
	</cffunction>

	<cffunction name="handleGrid" access="public" output="false" returntype="any">
		<cfargument name="url" required="false" type="any" />

		<cfscript>
			var grid = {
				pageNumber=1
				,rowsPerPage = 20
				,orderBy = "CategoryName"
				,orderDirection = "asc"
				,start=0
			};
		</cfscript>

		<cfif structKeyExists(arguments.url, "pageNumber")><cfset grid.pageNumber = arguments.url.pageNumber /></cfif>
		<cfif structKeyExists(arguments.url, "rowsPerPage")><cfset grid.rowsPerPage = arguments.url.rowsPerPage /></cfif>
		<cfif structKeyExists(arguments.url, "orderBy")><cfset grid.orderBy = arguments.url.orderBy /></cfif>
		<cfif structKeyExists(arguments.url, "orderDirection")><cfset grid.orderDirection = arguments.url.orderDirection /></cfif>
		<cfif structKeyExists(arguments.url, "start")><cfset grid.start = arguments.url.start /></cfif>

		<cfreturn getCategoryGateway().getGrid(grid=grid) />
	</cffunction>

	<cffunction name="handleRequest" access="public" output="false" returntype="any">
		<cfargument name="url" type="any" required="true" />

		<cfscript>
			var uid="";
			var result = {
				errorFields=""
				,message=""
			};
		</cfscript>

		<cfif structKeyExists(arguments.url, "uid")><cfset uid=arguments.url.uid /></cfif>

		<cfset var category = getCategoryGateway().getByKey(uid=uid) />

		<cfset var event = {category=category, result=result} />

		<cfreturn event />
	</cffunction>

</cfcomponent>