<cfcomponent>
	
	<cffunction name="init" output="false">
		<cfargument name="menuGateway" required="true" type="component" />
		<cfset variables.instance.menuGateway = arguments.menuGateway />
		<cfreturn this />
	</cffunction>

	<cffunction name="getMenuGateway" access="public" output="false">
		<cfreturn variables.instance.menuGateway />
	</cffunction>

	<cffunction name="getMenu" access="public" output="false" returntype="Query">
		<cfreturn getMenuGateway().getAll() />
	</cffunction>

	<cffunction name="HandleRequest" access="public" output="false" returntype="any">
		<cfargument name="url" type="any" required="true" default="" />

		<cfscript>
			var uid = "";
			var result = {
				errorFields=""
				,message=""
			};	
		</cfscript>

		<cfif structKeyExists(arguments.url, "uid")><cfset uid = "#arguments.uid#"/></cfif>

		<cfset var menuItem = getMenuGateway().getByKey(uid=uid) />
		<cfset var parents = getMenuGateway().getParents() />
		<cfset var event = { menuItem = menuItem, parents = parents, result=result } />

		<cfreturn event />		
	</cffunction>

	<cffunction name="HandleForm" access="public" output="false" returntype="any">
		<cfargument name="form" type="any" required="true" default="" />

		<cfscript>
			
		</cfscript>

	</cffunction>

</cfcomponent>