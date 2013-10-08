<cfoutput>


<form name="registerForm" id="registerForm" action="#buildUrl('register.register')#" method="post">
	<input type="hidden" id="fsw" name="fsw" value="" />

	<h2 class="form-signin-heading">Register User</h2>
 	<input type="text" name="firstName" id="firstName" class="input-block-level" placeholder="First Name" required><br/>
 	<input type="text" name="lastName" id="lastName" class="input-block-level" placeholder="Last Name" required><br/>
	<input type="text" name="email" id="email" class="input-block-level" placeholder="Email address" required><br/>
	<input type="password" name="password" id="password" class="input-block-level" placeholder="Password" required><br/><br/>
	
	<button class="btn btn-primary" type="button" id="registerBtn" name="registerBtn">Register</button>
	<button class="btn" type="button" id="cancelBtn">Cancel</button>
	<button class="btn" type="button" id="homeButton">Go to login page</button>
</form>


<script type="text/javascript">
	$(document).ready(function() {
		$("##registerBtn").click(function() {
			var errorText = "";
			if ($("##firstName").val() == "") { errorText = errorText + "First Name is mandatory!\n"; }
			if ($("##lastName").val() == "") { errorText = errorText + "Last Name is mandatory!\n"; }
			if ($("##email").val() == "") { errorText = errorText + "Email is mandatory!\n"; }
			if ($("##password").val() == "") { errorText = errorText + "Password is mandatory!\n"; }

			if (errorText != "") {
				alert(errorText);
			} else {
				$("##fsw").val("register");
				$("##registerForm").submit();
			}
		});

		$("##cancelBtn").click(function() {
			$("##firstName").val("");
			$("##lastName").val("");
			$("##email").val("");
			$("##password").val("");
		});

		$("##homeButton").click(function() {
			document.location="index.cfm?action=login";
		});
	});
</script>
</cfoutput>