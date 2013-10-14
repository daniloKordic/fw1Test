<cfcomponent>
	
	<cfscript>
		variables.instance.productUID="";
		variables.instance.productName="";
		variables.instance.productDescription="";
		variables.instance.dateCreated="";
		variables.instance.active=0;
	</cfscript>

	<cffunction name="init" access="public" output="false" returntype="product">
		<cfreturn this />
	</cffunction>

	<cffunction name="getProduct" access="public" output="false" returntype="Struct">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setProductUID" access="public" output="false">
		<cfargument name="productUID" type="string" required="true" />
		<cfset variables.instance.productUID = arguments.productUID />
	</cffunction>
	<cffunction name="getProductUID" access="public" output="false" returntype="String">
		<cfreturn variables.instance.productUID />
	</cffunction>

	<cffunction name="setProductName" access="public" output="false">
		<cfargument name="productName" type="string" required="true" />
		<cfset variables.instance.productName = arguments.productName />
	</cffunction>
	<cffunction name="getProductName" access="public" output="false" returntype="String">
		<cfreturn variables.instance.productName />
	</cffunction>

	<cffunction name="setProductDescription" access="public" output="false">
		<cfargument name="productDescription" type="string" required="true" />
		<cfset variables.instance.productDescription = arguments.productDescription />
	</cffunction>
	<cffunction name="getProductDescription" access="public" output="false" returntype="String">
		<cfreturn variables.instance.productDescription />
	</cffunction>

	<cffunction name="setDateCreated" access="public" output="false">
		<cfargument name="dateCreated" type="string" required="true" />
		<cfset variables.instance.dateCreated = arguments.dateCreated />
	</cffunction>
	<cffunction name="getDateCreated" access="public" output="false" returntype="String">
		<cfreturn variables.instance.dateCreated />
	</cffunction>

	<cffunction name="setActive" access="public" output="false">
		<cfargument name="active" type="Numeric" required="true" />
		<cfset variables.instance.active = arguments.active />
	</cffunction>
	<cffunction name="getActive" access="public" output="false" returntype="Numeric">
		<cfreturn variables.instance.active />
	</cffunction>


	<cffunction name="setupProduct" access="public" output="false" returntype="void">
		<cfargument name="productUID" required="false" type="string" default="" />
		<cfargument name="productName" required="false" type="string" default="" />
		<cfargument name="productDescription" required="false" type="string" default="" />
		<cfargument name="dateCreated" required="false" type="string" default="" />
		<cfargument name="active" required="false" type="string" default="0" />

		<cfset setProductUID(arguments.productUID) />
		<cfset setProductName(arguments.productName) />
		<cfset setProductDescription(arguments.productDescription) />
		<cfset setDateCreated(arguments.dateCreated) />
		<cfset setActive(arguments.active) />
	</cffunction>

	<cffunction name="reset" access="public" output="false" returntype="void">
		<cfset setProductUID("") />
		<cfset setProductName("") />
		<cfset setProductDescription("") />
		<cfset setdateCreated("") />
		<cfset setActive("") />
	</cffunction>

</cfcomponent>