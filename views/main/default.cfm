<cfoutput>
	<cfset userUID=""/>
	<cfset fullName = "Guest" />
	<cfset usertype= 2 />

	<cfif structKeyExists(session.auth, "user")>
		<cfset userUID = session.auth.user.getUID() />
		<cfset fullName = session.auth.user.getFirstName() & ' ' & session.auth.user.getLastName() />
		<cfset usertype = session.auth.user.getTypeID() />
	</cfif>	

	<cfif isDefined("rc.message") and rc.message neq "">
		<div class="alert alert-info expired">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			#rc.message#
		</div>
	</cfif>

	<h2 class="form-signin-heading">Welcome #fullName#</h2>

	<cfif usertype eq "1">
		<a href="#buildUrl('users.manage?uid=#userUID#')#">Manage Account</a>
		<br/>
		<a href="#buildUrl('users')#">Manage Users</a>
		<br/>
		<a href="#buildUrl('menu')#">Manage Menu</a>
		<br/>
		<a href="#buildUrl('products')#">Manage Products</a>
		<br/>
		<a href="#buildUrl('login.logout')#">Log out</a>
	</cfif>	
	
<cfdump var="#session.auth#"/>
</cfoutput>