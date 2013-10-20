<cfcomponent>

	<cfset variables.fw = ""/>
	<cffunction name="init" access="public" returntype="void">
		<cfargument name="fw" type="any" required="true"/>
		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="setMenuService" access="public" output="false" returntype="void">
		<cfargument name="menuService" type="any" required="true"/>
		<cfset variables.menuService = arguments.menuService />
	</cffunction>
	<cffunction name="getMenuService" access="public" output="false" returntype="any">
		<cfreturn variables.menuService />
	</cffunction>

	<cffunction name="before" access="public" returntype="void">
		<cfset setMenuService(application.beanFactory.GetBean('menuService')) />
	</cffunction>
	
	<cffunction name="default">
		<cfset var menuService = getMenuService() />
		<cfset rc.menu = menuService.getMenu() />
	</cffunction>
	
</cfcomponent>
