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
				m.MenuItemUID,
				MenuTitle=m.MenuTitle,
				PageUID=coalesce(m.PageUID,null),
				m.MenuItemLevel,
				ParentMenuItemUID=coalesce(m.ParentMenuItemUID,null),
				Sort,
				Fuse=case when m.PageUID is not null
					then ''
					else ''
				end
			from
				Menu m with (nolock)
			where
				1=1
			order
				by m.menuItemLevel, m.Sort
		</cfquery>

		<cfreturn qryMenu />
	</cffunction>

	<cffunction name="getByKey" access="public" output="false" returntype="struct">
		<cfargument name="uid" required="false" type="String" default="" />

		<cfset var menu = {
			parentUID=""
			,menuItemUID=""
			,menuTitle=""
			,menuItemLevel=""
		} />

		<cfreturn menu />
	</cffunction>

	<cffunction name="getParents" access="public" output="false" returntype="query">
		<cfset var qry=""/>

		<cfquery name="qry" datasource="#getDSN()#">
			select 
				m.* 
			from
				menu m with (nolock)
			where 
				m.menuitemuid in (select parentmenuitemuid from menu)
			order by
				m.sort
		</cfquery>

		<cfreturn qry />
	</cffunction>

</cfcomponent>