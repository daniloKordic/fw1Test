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

</cfcomponent>