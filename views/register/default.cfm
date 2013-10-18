<cfoutput>


<form name="registerForm" id="registerForm" action="#buildUrl('register.register')#" method="post">
	<input type="hidden" id="fsw" name="fsw" value="" />

	<h2 class="form-signin-heading">Register User</h2>
 	<input type="text" name="firstName" id="registerFirstName" class="input-block-level" placeholder="First Name" required><br/>
 	<input type="text" name="lastName" id="registerLastName" class="input-block-level" placeholder="Last Name" required><br/>
	<input type="text" name="email" id="registerEmail" class="input-block-level" placeholder="Email address" required><br/>
	<input type="text" name="username" id="registerUsername" class="input-block-level" placeholder="Username" required><br/>
	<input type="password" name="password" id="registerPassword" class="input-block-level" placeholder="Password" required><br/><br/>
	
	<button class="btn btn-primary" type="button" id="registerBtn" name="registerBtn">Register</button>
	<button class="btn" type="button" id="cancelBtn">Cancel</button>
	<button class="btn" type="button" id="homeButton">Go to login page</button>
</form>


<script type="text/javascript">
	$(document).ready(function() {
		$("##registerBtn").click(function() {
			var errorText = "";
			if ($("##registerFirstName").val() == "") { errorText = errorText + "First Name is mandatory!\n"; }
			if ($("##registerLastName").val() == "") { errorText = errorText + "Last Name is mandatory!\n"; }
			if ($("##registerEmail").val() == "") { errorText = errorText + "Email is mandatory!\n"; }
			if ($("##registerUsername").val() == "") { errorText = errorText + "Username is mandatory!\n"; }
			if ($("##registerPassword").val() == "") { errorText = errorText + "Password is mandatory!\n"; }

			if (errorText != "") {
				alert(errorText);
			} else {
				$("##fsw").val("save");
				$("##registerForm").submit();
			}
		});

		$("##cancelBtn").click(function() {
			$("##registerFirstName").val("");
			$("##registerLastName").val("");
			$("##registerEmail").val("");
			$("##registerUsername").val("");
			$("##registerPassword").val("");
		});

		$("##homeButton").click(function() {
			document.location="index.cfm?action=login";
		});
	});
</script>
</cfoutput>