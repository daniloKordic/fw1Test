<cfoutput>

	<h1>Edit user information:</h1>


	<form method="post" id="editUserForm" action="#buildUrl('user.verifyEdit')#">
		First Name: <input type="text" name="firstName" id="firstName" value="#rc.firstName#"/><br/><br/>
		Last Name: <input type="text" name="lastName" id="lastName" value="#rc.lastName#"/><br/><br/>
		Passord: <input type="text" name="password" id="password" value="#rc.password#"/><br/><br/>
	</form>
	<cfdump var="#session#"/>

</cfoutput>