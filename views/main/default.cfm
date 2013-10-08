<cfoutput>

	<cfset userUID = session.auth.user.getUID() />
	<cfset fullName = session.auth.user.getFirstName() & ' ' & session.auth.user.getLastName() />
	<h2 class="form-signin-heading">Welcome #fullName#</h2>

	<a href="#buildUrl('users.manage?uid=#userUID#')#">Manage User</a>
	<a href="#buildUrl('login.logout')#">Log out</a>

</cfoutput>