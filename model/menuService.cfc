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

</cfcomponent>