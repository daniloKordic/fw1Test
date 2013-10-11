<cfcomponent extends="framework">
	<cfset this.sessionmanagement = true />
	<cfset this.sessiontimeout = createTimeSpan(0, 0, 10, 0) />

	<cfset variables.framework.reloadApplicationOnEveryRequest = true />
	<cfset variables.framework.suppressImplicitSerice = true />

	<cffunction name="setupApplication">
		<cfset application.dsn = "fw1Test"/>

		<!--- initialize coldspring --->
		<cfset application.coldspringConfig = "/fw1Test/assets/config/coldspring.xml.cfm" />

		<cfscript>
			application.settings = {
				dsn = "fw1Test"
			};
		</cfscript>
		

		<!--- initialize singleton components --->
		<cfset application.beanFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory").init(defaultProperties=application.settings) />
		<cfset application.beanFactory.loadBeans(application.coldspringConfig) />

		<cfset application.assets = "assets/"/>

	</cffunction>

	<cffunction name="setupRequest">
		<cfset controller('security.authorize') />
		<cfset request.ServiceLocation ="http://#cgi.HTTP_HOST#/model/" />
	</cffunction>

	<cffunction name="setupSession">
		<cfset controller('security.session') />
	</cffunction>
	
	<!--- test comment --->
</cfcomponent>