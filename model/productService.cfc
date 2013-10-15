<cfcomponent>
	
	<cffunction name="init" output="false">
		<cfargument name="productGateway" required="true" type="component" />
		<cfset variables.instance.productGateway = arguments.productGateway />
		<cfreturn this />
	</cffunction>

	<cffunction name="getProductGateway" access="private" output="false">
		<cfreturn variables.instance.productGateway />
	</cffunction>

	<cffunction name="handleGrid" access="public" output="false" returntype="any">
		<cfargument name="url" type="any" required="true" />

		<cfscript>
			var grid = {
				pageNumber=1
				,rowsPerPage = 20
				,orderBy = "updated"
				,orderDirection = "desc"
				,start=0
			};
		</cfscript>

		<cfif structKeyExists(arguments.url, "pageNumber")><cfset grid.pageNumber = arguments.url.pageNumber /></cfif>
		<cfif structKeyExists(arguments.url, "rowsPerPage")><cfset grid.rowsPerPage = arguments.url.rowsPerPage /></cfif>
		<cfif structKeyExists(arguments.url, "orderBy")><cfset grid.orderBy = arguments.url.orderBy /></cfif>
		<cfif structKeyExists(arguments.url, "orderDirection")><cfset grid.orderDirection = arguments.url.orderDirection /></cfif>
		<cfif structKeyExists(arguments.url, "start")><cfset grid.start = arguments.url.start /></cfif>

		<cfreturn getProductGateway().getGrid(grid=grid) />
	</cffunction>

	<cffunction name="HandleRequest" access="public" output="false" returntype="any">
		<cfargument name="url" type="any" required="true" />

		<cfscript>
			var uid = "";
			var result = {
			 	errorFields=""
			 	,message=""
			};
		</cfscript>

		<cfif structKeyExists(arguments.url, "uid")><cfset uid=arguments.url.uid /></cfif>

		<cfset var product = getProductGateway().getByKey(uid=uid) />
		
		<cfset var event = {product=product, result=result} />

		<cfreturn event />
	</cffunction>

	<cffunction name="HandleForm" access="public" output="false" returntype="any">
		<cfargument name="form" type="any" required="true" />

		<cfscript>
			var product = createObject("component","model.product").init();
			var productUID = "";
			var productName = "";
			var productDesc = "";
			var isActive = 0;
		</cfscript>

		<cfif structKeyExists(arguments.form, "productUID")><cfset productUID=arguments.form.productUID /></cfif>
		<cfif structKeyExists(arguments.form, "productName")><cfset productName=arguments.form.productName /></cfif>
		<cfif structKeyExists(arguments.form, "productDescription")><cfset productDescription=arguments.form.productDescription /></cfif>
		<cfif structKeyExists(arguments.form, "active")><cfset isActive=arguments.form.active /></cfif>

		<cfset product.setupProduct (
			productUID=productUID
			,productName=productName
			,productDescription=productDescription
			,active=isActive
		) />
		<cfdump var="#product.getActive()#" output="C:\qrt.txt"/>
		<cfif structKeyExists(arguments.form, "fsw")>
			<cfswitch expression="#arguments.form.fsw#">
				<cfcase value="save">
					<cfset filter = {
						productName = product.getProductName()
					} />

					<cfset var qHowMany = getProductGateway().getByFilter(filter=filter) />

					<cfif qHowMany.recordcount eq 0>
						<cfset var newProductUID=getProductGateway().save(product=product) />
					</cfif>
				</cfcase>
				<cfcase value="update">
					<cfset result = getProductGateway().save(product = product) />
				</cfcase>
				<cfcase value="delete">
					<cfset result = getProductGateway().delete(product = product) />
				</cfcase>
			</cfswitch>
		</cfif>

		
		<cfset var event = {
			product = product
			,result = result
		} />

		<cfreturn event />
	</cffunction>
</cfcomponent>