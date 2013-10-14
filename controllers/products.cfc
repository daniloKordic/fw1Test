<cfcomponent>
	
	<cfset variables.fw = ""/>
	<cffunction name="init" access="public" returntype="void">
		<cfargument name="fw" type="any" required="true"/>
		<cfset variables.fw = arguments.fw />
	</cffunction>

	<cffunction name="setProductService" access="public" output="false" returntype="void">
		<cfargument name="productService" type="any" required="true" />
		<cfset variables.productService=arguments.productService />
	</cffunction>
	<cffunction name="getProductService" access="public" output="false" returntype="Any">
		<cfreturn variables.productService />
	</cffunction>

	<cffunction name="before" access="public" returntype="void">
		<cfset setProductService(application.beanFactory.GetBean('productService')) />
	</cffunction>

	<cffunction name="default" access="public" returntype="void">
		<cfset var productService = getProductService() />
		<cfset rc.qGrid = productService.handleGrid(url) />
	</cffunction>

	<cffunction name="manage" access="public" returntype="void">
		<cfset var productService = getProductService() />

		<cfif structKeyExists(rc, "action") and Len(rc.action)>
			<cfset var event = productService.HandleForm(form) />
		<cfelse>
			<cfset var event = productService.HandleRequest(url) />
		</cfif>

		<cfset rc = structAppend(rc, event) />
	</cffunction>

</cfcomponent>