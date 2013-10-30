<cfcomponent>

	<cfset variables.fw = ""/>
	<cffunction name="init" access="public" returntype="void">
		<cfargument name="fw" type="any" required="true"/>
		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="setCategoriesService" access="public" output="false" returntype="void">
		<cfargument name="categoryService" type="any" required="true" />
		<cfset variables.categoryService = arguments.categoryService />		
	</cffunction>
	<cffunction name="getCategoriesService" access="public" output="false" returntype="any">
		<cfreturn variables.categoryService />
	</cffunction>

	<cffunction name="before" access="public" returntype="void">
		<cfargument name="rc" type="struct" required="true" />

		<cfset setCategoriesService(application.beanFactory.getBean('categoryService')) />
	</cffunction>
	
	<cffunction name="default">
		<cfset var categoryService = getCategoriesService() />
		<cfset var rc.categories = categoryService.getCategories() />
	</cffunction>
	
</cfcomponent>
