<cfcomponent displayname="category" output="false">
	
	<cfscript>
		variables.instance.CategoryUID="";
		variables.instance.CategoryName="";
		variables.instance.CategoryDetails="";
		variables.instance.ParentUID="";
		variables.instance.DateCreated="";
		variables.instance.DateUpdated="";
	</cfscript>

	<cffunction name="init" access="public" output="false" returntype="category">
		<cfreturn this />
	</cffunction>

	<cffunction name="getCategory" access="public" output="false" returntype="struct">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setCategoryUID" access="public" output="false">
		<cfargument name="CategoryUID" type="string" required="false" default=""/>
		<cfset variables.instance.CategoryUID=arguments.CategoryUID />
	</cffunction>
	<cffunction name="getCategoryUID" access="public" output="false" returntype="string">
		<cfreturn variables.instance.CategoryUID />
	</cffunction>

	<cffunction name="setCategoryName" access="public" output="false">
		<cfargument name="CategoryName" type="string" required="false" default=""/>
		<cfset variables.instance.CategoryNam=arguments.CategoryName />
	</cffunction>
	<cffunction name="getCategoryName" access="public" output="false" returntype="string">
		<cfreturn variables.instance.CategoryName />
	</cffunction>

	<cffunction name="setCategoryDetails" access="public" output="false">
		<cfargument name="CategoryDetails" type="string" required="false" default=""/>
		<cfset variables.instance.CategoryDetails=arguments.CategoryDetails />
	</cffunction>
	<cffunction name="getCategoryDetails" access="public" output="false" returntype="string">
		<cfreturn variables.instance.CategoryDetails />
	</cffunction>

	<cffunction name="setParentUID" access="public" output="false">
		<cfargument name="ParentUID" type="string" required="false" default=""/>
		<cfset variables.instance.ParentUID=arguments.ParentUID />
	</cffunction>
	<cffunction name="getParentUID" access="public" output="false" returntype="string">
		<cfreturn variables.instance.ParentUID />
	</cffunction>

	<cffunction name="setDateCreated" access="public" output="false">
		<cfargument name="DateCreated" type="string" required="false" default=""/>
		<cfset variables.instance.DateCreated=arguments.DateCreated />
	</cffunction>
	<cffunction name="getDateCreated" access="public" output="false" returntype="string">
		<cfreturn variables.instance.DateCreated />
	</cffunction>

	<cffunction name="setDateUpdated" access="public" output="false">
		<cfargument name="DateUpdated" type="string" required="false" default=""/>
		<cfset variables.instance.DateUpdated=arguments.DateUpdated />
	</cffunction>
	<cffunction name="getDateUpdated" access="public" output="false" returntype="string">
		<cfreturn variables.instance.DateUpdated />
	</cffunction>

	<cffunction name="setupCategory" access="public" output="false" returntype="void">
		<cfargument name="CategoryUID" required="false" type="string" default="" />
		<cfargument name="CategoryName" required="false" type="string" default="" />
		<cfargument name="CategoryDetails" required="false" type="string" default="" />
		<cfargument name="ParentUID" required="false" type="string" default="" />
		<cfargument name="DateCreated" required="false" type="string" default="" />
		<cfargument name="DateUpdated" required="false" type="string" default="" />

		<cfset setCategoryUID(arguments.CategoryUID)>
		<cfset setCategoryName(arguments.CategoryName)>
		<cfset setCategoryDetails(arguments.CategoryDetails)>
		<cfset setParentUID(arguments.ParentUID)>
		<cfset setDateCreated(arguments.DateCreated)>
		<cfset setDateUpdated(arguments.DateUpdated)>
	</cffunction>

	<cffunction name="reset" access="public" output="false" returntype="void">
		<cfset setCategoryUID('')>
		<cfset setCategoryName('')>
		<cfset setCategoryDetails('')>
		<cfset setParentUID('')>
		<cfset setDateCreated('')>
		<cfset setDateUpdated('')>
	</cffunction>

</cfcomponent>