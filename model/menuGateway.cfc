<cfcomponent>
	
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

	<cffunction name="getAll" access="public" output="false" returntype="Query">
		<cfset qryMenu = ""/>

		<cfquery name="qryMenu" datasource="#getDSN()#">
			select 
				m.*
			from 
				menu m with (nolock)
		</cfquery>

		<cfreturn qryMenu />
	</cffunction>

</cfcomponent>