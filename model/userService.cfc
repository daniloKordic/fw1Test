<cfcomponent displayname="User Service" output="false">
	
	<cffunction name="init" output="false">
		<cfargument name="userGateway" required="true" type="component" />
		<cfset variables.instance.userGateway = arguments.userGateway />
		<cfreturn this />
	</cffunction>

	<cffunction name="getUserGateway" access="public" output="false">
		<cfreturn variables.instance.userGateway />
	</cffunction>

	<cffunction name="getUsers" access="public" output="false" returntype="Query">
		<cfreturn getuserGateway.getAll() />
	</cffunction>

	<cffunction name="getByEmail" access="public" returntype="any">
		<cfargument name="email" type="string" required="false" default="">

		<cfset var result = ""/>
		<cfset var user = ""/>

		<cfif len(arguments.email)>
			<cfset result = getUserGateway().getByEmail(email=arguments.email) />
		</cfif>

		<cfif not isStruct(result)>
			<cfset result = createObject("component","mode.user").init() />
		</cfif>

		<cfreturn result />
	</cffunction>

	<cffunction name="validatePassword" access="public" output="false" returntype="boolean">
		<cfargument name="user" required="true" type="any" />
		<cfargument name="password" required="true" type="string" />
		<cfset var validPass = false />

		<cfif arguments.password eq arguments.user.getPassword()>
			<cfset validPass = true />
		</cfif>

		<cfreturn validPass />
	</cffunction>

	<cffunction name="handleForm" access="public" output="false" returntype="Any">
		<cfargument name="form" type="any" required="true" />

		<cfset user = createObject("component", "model.user").init() />
		
		<cfset var uid=""/>
		<cfset var firstName=""/>
		<cfset var lastName=""/>
		<cfset var email=""/>
		<cfset var password=""/>

		<cfif structKeyExists(arguments.form, "uid")><cfset uid=arguments.form.uid /></cfif>
		<cfif structKeyExists(arguments.form, "firstName")><cfset firstName=arguments.form.firstName /></cfif>
		<cfif structKeyExists(arguments.form, "lastName")><cfset lastName=arguments.form.lastName /></cfif>
		<cfif structKeyExists(arguments.form, "email")><cfset email=arguments.form.email /></cfif>
		<cfif structKeyExists(arguments.form, "password")><cfset password=arguments.form.password /></cfif>

		<cfset user.setupUser (
			uid=uid
			,firstName=firstName
			,lastName=lastName
			,email=email
			,password=password
		) />

		<cfif structKeyExists(arguments.form, "fsw")>
			<cfswitch expression="#arguments.form.fsw#">
				<cfcase value="register">
					
					<cfif len(user.getUID())>
						<cfset filter = {
							uid = user.getUID()
							,uidSign="!="
							,email=user.getEmail()
						} />
					<cfelse>
						<cfset filter = {
							email = user.getEmail()
						} />	
					</cfif>
					

					<cfset var qExists = getUserGateway().getByFilter(filter=filter) />

					<cfif qExists.recordCount eq 0>
						<cfset var newUserUID = getUserGateway().save(user=user) />
						<cfset user.setUID(newUserUID) />
						<cfset result.message= "User Successfully saved." />
					<cfelse>
						<cfset result.message = "Such user already exists in our database."/>
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

		<cfset var uid = "" />
		<cfset var result = {
			message=""
		} />
		<cfif structKeyExists(arguments.url, "uid")><cfset uid=arguments.url.uid /></cfif>
		<cfset var user=getUserGateway().getByKey(userUID=uid) />
		<cfset var event = { user=user, result=result } />

		<cfreturn event />
	</cffunction>

</cfcomponent>