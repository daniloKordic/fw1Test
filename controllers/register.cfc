<cfcomponent>
	
	<cfset variables.fw = "" />

	<cffunction name="init" access="public" returntype="void">
		<cfargument name="fw" type="any" required="true" />
		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="setUserService" access="public" output="false" returntype="void">
		<cfargument name="userService" type="any" required="true" />
		<cfset variables.userService = arguments.userService />
	</cffunction>
	<cffunction name="getUserService" access="public" output="false" returntype="Any">
		<cfreturn variables.userService />
	</cffunction>
	<cffunction name="setMenuService" access="public" output="false" returntype="void">
		<cfargument name="menuService" type="any" required="true"/>
		<cfset variables.menuService = arguments.menuService />
	</cffunction>
	<cffunction name="getMenuService" access="public" output="false" returntype="any">
		<cfreturn variables.menuService />
	</cffunction>

	<cffunction name="before" access="public" output="false" returntype="void">
		<cfargument name="rc" type="struct" required="true" />
		<!--- <cfif session.auth.isLoggedIn and variables.fw.getItem() is not 'logout'>
			<cfset variables.fw.redirect('main') />
		</cfif> --->
		<cfset setUserService(application.beanFactory.GetBean('userService')) />
		<cfset setMenuService(application.beanFactory.GetBean('menuService')) />

		<cfset var menuService = getMenuService() />
		<cfset rc.menu = menuService.getMenu() />
	</cffunction>

	<cffunction name="beforeRegister" access="public" output="false" returntype="any">		
		<cfset var menuService = getMenuService() />
		<cfset rc.menu = menuService.getMenu() />
	</cffunction>

	<cffunction name="register" access="public" output="false" returntype="void">
		
		<cfset var userService = getUserService() />

		<cfif structKeyExists(rc, "fsw") and Len(rc.fsw)>
			<cfset var event = getUserService().handleForm(form) />
		<cfelse>
			<cfset variables.fw.redirect("register") />
		</cfif>
		
		<cfset rc = structAppend(rc, event) />

	</cffunction>

</cfcomponent>