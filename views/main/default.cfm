<cfoutput>

	<cfset userUID = session.auth.user.getUID() />
	<cfset fullName = session.auth.user.getFirstName() & ' ' & session.auth.user.getLastName() />
	<cfset usertype = session.auth.user.getTypeID() />

	<h2 class="form-signin-heading">Welcome #fullName#</h2>

	<a href="#buildUrl('users.manage?uid=#userUID#')#">Manage User</a>
	<cfif usertype eq "1">
		<br/>
		<a href="#buildUrl('users.manage')#">Manage Users</a>
		<br/>
		<a href="#buildUrl('menu')#">Manage Menu</a>
		<br/>
		<a href="#buildUrl('products')#">Manage Products</a>
	</cfif>	
	<br/>
	<a href="#buildUrl('login.logout')#">Log out</a>

</cfoutput>