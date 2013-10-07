<cfcomponent displayname="User" output="false">
	
	<cfscript>
		variables.instance.UID = "";
		variables.instance.FirstName = "";
		variables.instance.LastName = "";
		variables.instance.Email = "";
		variables.instance.Password = "";
		variables.instance.IsActive = 0;
	</cfscript>

	<cffunction name="init" access="public" output="false" returntype="user">
		<cfreturn this />
	</cffunction>

	<cffunction name="getUser" access="public" output="false" returntype="struct">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setUID" access="public" output="false">
		<cfargument name="UID" type="string" required="true" />
		<cfset variables.instance.UID = arguments.UID />
	</cffunction>
	<cffunction name="getUID" access="public" returntype="String" output="false">
		<cfreturn variables.instance.UID />
	</cffunction>

	<cffunction name="setFirstName" access="public" output="false">
		<cfargument name="Firstname" type="string" required="true" />
		<cfset variables.instance.FirstName = arguments.FirstName />
	</cffunction>
	<cffunction name="getFirstName" access="public" returntype="String" output="false">
		<cfreturn variables.instance.FirstName />
	</cffunction>

	<cffunction name="setLastName" access="public" output="false">
		<cfargument name="LastName" type="string" required="true" />
		<cfset variables.instance.LastName = arguments.LastName />
	</cffunction>
	<cffunction name="getLastName" access="public" returntype="String" output="false">
		<cfreturn variables.instance.LastName />
	</cffunction>

	<cffunction name="setEmail" access="public" output="false">
		<cfargument name="Email" type="string" required="true" />
		<cfset variables.instance.Email = arguments.Email />
	</cffunction>
	<cffunction name="getEmail" access="public" returntype="String" output="false">
		<cfreturn variables.instance.Email />
	</cffunction>

	<cffunction name="setPassword" access="public" output="false">
		<cfargument name="Password" type="string" required="true" />
		<cfset variables.instance.Password = arguments.Password />
	</cffunction>
	<cffunction name="getPassword" access="public" returntype="String" output="false">
		<cfreturn variables.instance.Password />
	</cffunction>

	<cffunction name="setIsActive" access="public" output="false">
		<cfargument name="IsActive" type="numeric" required="true" />
		<cfset variables.instance.IsActive = arguments.IsActive />
	</cffunction>
	<cffunction name="getIsActive" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.IsActive />
	</cffunction>

	<cffunction name="setupUser" access="public" output="false" returntype="void">
		<cfargument name="UID" required="false" type="string" default="" />
		<cfargument name="FirstName" required="false" type="string" default="" />
		<cfargument name="LastName" required="false" type="string" default="" />
		<cfargument name="Email" required="false" type="string" default="" />
		<cfargument name="Password" required="false" type="string" default="" />
		<cfargument name="IsActive" required="false" type="numeric" default="0" />

		<cfset setUID(arguments.UID)>
		<cfset setFirstName(arguments.FirstName)>
		<cfset setLastName(arguments.LastName)>
		<cfset setEmail(arguments.Email)>
		<cfset setPassword(arguments.Password)>
		<cfset setIsActive(arguments.IsActive)>
	</cffunction>

	<cffunction name="reset" access="public" output="false" returntype="void">
		<cfset setUID('')>
		<cfset setFirstName('')>
		<cfset setLastName('')>
		<cfset setEmail('')>
		<cfset setPassword('')>
		<cfset setIsActive(0)>
	</cffunction>

</cfcomponent>