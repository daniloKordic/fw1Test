<cfoutput>
	<script type="text/javascript">
	 $(document).ready(function() {
	 	$("##registerBtn").click(function() {
	 		document.location="index.cfm?action=register";
	 	});
	 });
	</script>

<cfif structKeyExists(rc, "message")>
	#rc.message[1]#
</cfif>
<form name="loginform" class="form-signin" action="#buildURL('login.login')#" method="post">
	<h2 class="form-signin-heading">Sign in</h2>
	<input type="text" name="email" class="input-block-level" placeholder="Email address" required>
	<input type="password" name="password" class="input-block-level" placeholder="Password" required>
	<label class="checkbox">
		<input type="checkbox" name="rememberme"> Remember me
	</label>
	<button class="btn btn-large btn-primary" type="submit">Sign in</button>
	<button type="button" id="registerBtn">Register</button>
</form>

</cfoutput>	