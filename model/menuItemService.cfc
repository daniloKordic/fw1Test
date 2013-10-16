<cfcomponent>
	
	<cffunction name="init" output="false">
		<cfargument name="menuItemGateway" required="true" type="component" />
		<cfset variables.instance.menuItemGateway = arguments.menuItemGateway />
		<cfreturn this />
	</cffunction>

	<cffunction name="getMenuItemGateway" access="private" output="false">
		<cfreturn variables.instance.menuItemGateway />
	</cffunction>

	

</cfcomponent>