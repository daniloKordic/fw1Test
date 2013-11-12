<cfcomponent extends="framework">
	<cfset this.sessionmanagement = true />
	<cfset this.sessiontimeout = createTimeSpan(0, 1, 0, 0) />

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

		
		<cfset application.root  = getDirectoryFromPath(getCurrentTemplatePath()) />
		<cfset application.WebLocation = "http://#cgi.SERVER_NAME#/fw1Test/" />

		<cfset application.assets = "assets/"/>
		<cfset application.model = "#application.root#model\"/>
		<cfset application.ImagesDir="#application.root#Images\"/>
		<cfset application.ImagesDirRel="Images/"/>
		<cfif not DirectoryExists(application.ImagesDir)>
			<cfdirectory action="Create" directory="#application.ImagesDir#">
		</cfif>
		<cfset application.TempImagesDir="#application.root#tmpImages\"/>
		<cfif not DirectoryExists(application.TempImagesDir)>
			<cfdirectory action="Create" directory="#application.TempImagesDir#">
		</cfif>

		<cfset application.com = "fw1Test.model" />

	</cffunction>

	<cffunction name="setupRequest">
		<cfset controller('security.authorize') />
		<cfset controller('menu') />
	</cffunction>

	<cffunction name="setupSession">
		<cfset controller('security.session') />
	</cffunction>
	
	<!--- test comment --->
</cfcomponent>