<cfcomponent displayname="User Service" output="false">
	
	<cffunction name="init" output="false">
		<cfargument name="userGateway" required="true" type="component" />
		<cfset variables.instance.userGateway = arguments.userGateway />
		<cfreturn this />
	</cffunction>

	<cffunction name="getUserGateway" access="public" output="false">
		<cfreturn variables.instance.userGateway />
	</cffunction>

	<cffunction name="handleGrid" access="public" output="false" returntype="any">
		<cfargument name="url" required="false" type="any" />

		<cfscript>
			var grid = {
				pageNumber=1
				,rowsPerPage = 20
				,orderBy = "FirstName"
				,orderDirection = "asc"
				,start=0
			};
		</cfscript>

		<cfif structKeyExists(arguments.url, "pageNumber")><cfset grid.pageNumber = arguments.url.pageNumber /></cfif>
		<cfif structKeyExists(arguments.url, "rowsPerPage")><cfset grid.rowsPerPage = arguments.url.rowsPerPage /></cfif>
		<cfif structKeyExists(arguments.url, "orderBy")><cfset grid.orderBy = arguments.url.orderBy /></cfif>
		<cfif structKeyExists(arguments.url, "orderDirection")><cfset grid.orderDirection = arguments.url.orderDirection /></cfif>
		<cfif structKeyExists(arguments.url, "start")><cfset grid.start = arguments.url.start /></cfif>

		<cfreturn getUserGateway().getGrid(grid=grid) />
	</cffunction>

	<cffunction name="handleForm" access="public" output="false" returntype="Any">
		<cfargument name="form" type="any" required="true" />

		<cfscript>
			var user = createObject("component", "model.user").init();		
			var userUID="";
			var firstName="";
			var lastName="";
			var email="";
			var username="";
			var password="";
		</cfscript>
		
		<cfif structKeyExists(arguments.form, "userUID")><cfset uid=arguments.form.userUID /></cfif>
		<cfif structKeyExists(arguments.form, "firstName")><cfset firstName=arguments.form.firstName /></cfif>
		<cfif structKeyExists(arguments.form, "lastName")><cfset lastName=arguments.form.lastName /></cfif>
		<cfif structKeyExists(arguments.form, "email")><cfset email=arguments.form.email /></cfif>
		<cfif structKeyExists(arguments.form, "username")><cfset username=arguments.form.username /></cfif>
		<cfif structKeyExists(arguments.form, "password")><cfset password=arguments.form.password /></cfif>

		<cfset user.setupUser (
			userUID=uid
			,firstName=firstName
			,lastName=lastName
			,email=email
			,username=username
			,password=password
		) />

		<cfif structKeyExists(arguments.form, "fsw")>
			<cfswitch expression="#arguments.form.fsw#">
				<cfcase value="save">
					
					<cfset filter = {
						username = user.getUsername()
					} />

					<cfset var qHowMany = getUserGateway().getByFilter(filter=filter) />

					<cfif qHowMany.recordCount eq 0>
						<cfset var newUserUID = getUserGateway().save(user=user) />
						<cfset result.message="User Successfully saved!"/>
					<cfelse>
						<cfset result.message = "Duplicate User Found!"/>
						<cfset user.reset() />
					</cfif>					
				</cfcase>
				<cfcase value="update">
					<cfset var rezultat = getUserGateway().save(user = user) />
					<cfif rezultat neq "">
						<cfset result.message = "User successfully updated!" />
					</cfif>
				</cfcase>
				<cfcase value="delete">
					<cfset var rezultat = getUserGateway().delete(user = user) />
					<cfif rezultat eq 1>
						<cfset result.message = "User successfully deleted!" />
					</cfif>
				</cfcase>
			</cfswitch>
		</cfif>

		<cfset var event = {
			user = user
			,result = result
		} />

		<cfreturn event />
	</cffunction>

	<cffunction name="handleRequest" access="public" output="false" returntype="any">
		<cfargument name="url" type="any" required="true" />

		<cfscript>
			var uid = "";
			var result = {
			 	errorFields=""
			 	,message=""
			};
		</cfscript>

		<cfif structKeyExists(arguments.url, "uid")><cfset uid=arguments.url.uid /></cfif>

		<cfset var user = getUserGateway().getByKey(uid=uid) />
		
		<cfset var event = {user=user, result=result} />

		<cfreturn event />
	</cffunction>

</cfcomponent>