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

	<div class="fileupload fileupload-new" data-provides="fileupload">
		<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;"><img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image" /></div>
		<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
		<div>
			<span class="btn btn-file">
				<span class="fileupload-new">Select image</span>
				<span class="fileupload-exists">Change</span>
				<input type="file" />
			</span>
			<a href="##" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
		</div>
	</div>

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