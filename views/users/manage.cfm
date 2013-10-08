<cfoutput>

	<script type="text/javascript">
		function processForm() {
			var error = "";

			if ($("##firstName").val() == "") { error = error + "First Name is required.\n"; }
			if ($("##lastName").val() =="") { error = error + "Last Name is required.\n"; }
			if ($("##email").val() == "") { error = error + "Email is required.\n"; }
			if ($("##password").val() == "") { error = error + "Password is required.\n"; }

			if (error == "") {
				$("##fsw").val("register");
				$("##userRegister").submit();
			} else {
				alert(error);
			}
		}
		function gotoHome() {
			window.location="index.cfm?action=main.default";
		}
		function cancel() {
			$("##firstName").val("#rc.user.getFirstName()#");
			$("##lastName").val("#rc.user.getLastName()#");
			$("##email").val("#rc.user.getEmail()#");
			$("##password").val("#rc.user.getPassword()#");
		}
	</script>

<cfif rc.result.message neq "">
	#rc.result.message#
</cfif>

	<h1>Edit user details</h1>
	<form action="#buildUrl('users.manage')#" method="post" id="userRegister">
		<input type="hidden" id="fsw" name="fsw" value=""/>
		<input type="hidden" id="uid" name="uid" value="#rc.user.getUID()#"/>

		<input type="text" id="firstName" name="firstName" value="#rc.user.getFirstName()#" required placeholder="Enter first name"/><br/><br/>
		<input type="text" id="lastName" name="lastName" value="#rc.user.getLastName()#" required placeholder="Enter last name"/><br/><br/>
		<input type="text" id="email" name="email" value="#rc.user.getEmail()#" required placeholder="Enter email"/></br><br/>
		<input type="password" id="password" name="password" value="#rc.user.getPassword()#" required placeholder="Enter password"/><br/><br/>
		<cfif rc.user.getUID() neq "">
			<input type="button" value="Save changes" onclick="processForm()"/>
		<cfelse>	
			<input type="button" value="Register" onclick="processForm()"/>
		</cfif>
		
		<input type="button" value="Cancel" onclick="cancel()" />
		<input type="button" value="Home" onclick="gotoHome()"/>
	</form>

</cfoutput>