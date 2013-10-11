<cfoutput>

	<cfset userUID = session.auth.user.getUID() />
	<cfset fullName = session.auth.user.getFirstName() & ' ' & session.auth.user.getLastName() />
	<cfset usertype = session.auth.user.getTypeID() />

	<h2 class="form-signin-heading">Welcome #fullName#</h2>

	<a href="#buildUrl('users.manage?uid=#userUID#')#">Manage User</a>
	<br/>
	<cfif usertype eq "1">
		<a href="#buildUrl('menu')#">Manage Menu</a>
	</cfif>	
	<br/>
	<a href="#buildUrl('login.logout')#">Log out</a>


<cfdump var="#session#"/>
</cfoutput>