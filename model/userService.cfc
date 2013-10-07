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

</cfcomponent>