<cfcomponent>
	
	<cfset variables.instance = {} />

	<cffunction name="init" output="false">
		<cfargument name="settings" required="true" type="any" />
		<cfset variables.instance.config = arguments.settings.getConfig() />
		<cfset variables.instance.dsn = variables.instance.config.dsn />
	</cffunction>

	<cffunction name="getDSN" access="private" output="false" returntype="String">
		<cfreturn variables.instance.dsn />
	</cffunction>

	<!--- CREATE --->
	<cffunction name="create" access="public" output="false" returntype="String">
		<cfargument name="product" required="true" type="any" />
		<cfset var qry=""/>
		<cfquery name="qry" datasource="#getDSN()#">
			select newid() as newuid
		</cfquery>
		<cfset var uid = qry.newuid />
		<cfquery name="qry" datasource="#getDSN()#">
			insert into Products (
				ProductUID
				,ProductName
				,ProductDescription
				,dateCreated
				,active
			) values (
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#uid#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.product.getProductName()#" />
				,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.product.getProductDescription()#" />
				,GetDate()
				,1
			)
		</cfquery>
		<cfreturn uid />
	</cffunction>

	<!--- UPDATE --->
	<cffunction name="update" access="public" output="false" returntype="String">
		<cfargument name="product" required="true" type="any" />
		<cfset var qry=""/>
		<cfset var uid = arguments.product.getProductUID() />
		<cfquery name="qry" datasource="#getDSN()#">
			update Products set
				ProductName=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.product.getProductName()#" />
				,ProductDescription=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.product.getProductDescription()#" />
				,active=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.product.getActive()#" />
			where
				ProductUID=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.product.getProductUID()#" />
		</cfquery>

		<cfreturn uid />
	</cffunction>

	<!--- SAVE --->
	<cffunction name="save" access="public" output="false" returntype="String">
		<cfargument name="product" required="true" type="any" />
		<cfset var uid = ""/>
		<cfif len(arguments.product.getProductUID())>
			<cfset var uid = update(product=arguments.product) />
		<cfelse>
			<cfset var uid = create(product=arguments.product) />
		</cfif>
		<cfreturn uid />
	</cffunction>

	<!--- READ --->
	<cffunction name="getGrid" access="public" output="false" returntype="Query">
		<cfargument name="grid" type="any" required="true" />

		<cfset var qry = "" />

		<cfquery name="qry" datasource="#getDSN()#">
			select
				p.*
			from
				Products p with (nolock)
		</cfquery>

		<cfreturn qry />
	</cffunction>

	<cffunction name="getByKey" access="public" output="false" returntype="any">
		<cfargument name="uid" type="any" required="true" />
		<cfset qry = ""/>
		<cfset var product = createObject("component", "model.product").init() />

		<cfif arguments.uid neq "">
			<cfquery name="qry" datasource="#getDSN()#">
				select
					p.ProductUID
					,p.ProductName
					,p.ProductDescription
					,p.dateCreated
					,p.active
				from
					Products p with (nolock)
				where
					1=1
					and p.ProductUID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.uid#" />
			</cfquery>	

			<cfif qry.recordCount eq 1>
				<cfset product.setupProduct(
					productUID=qry.ProductUID
					,productName=qry.ProductName
					,productDescription=qry.ProductDescription
					,dateCreated=qry.dateCreated
					,active=qry.active
				) />
			</cfif>
		</cfif>		

		<cfreturn product />
	</cffunction>

	<!--- DELETE --->
	<cffunction name="delete" access="public" output="false" returntype="Numeric">
		<cfargument name="product" required="true" type="any" />
		<cfset qry=""/>

		<cfquery name="qry" datasource="#getDSN()#">
			delete from Products where ProductUID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.product.getProductUID()#" />
		</cfquery>

		<cfreturn 1 />
	</cffunction>

</cfcomponent>