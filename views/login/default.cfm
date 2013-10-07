<cfoutput>

<form name="loginform" class="form-signin" action="#buildURL('login.login')#" method="post">
	<h2 class="form-signin-heading">Sign in</h2>
	<input type="text" name="email" class="input-block-level" placeholder="Email address">
	<input type="password" name="password" class="input-block-level" placeholder="Password">
	<label class="checkbox">
		<input type="checkbox" name="rememberme"> Remember me
	</label>
	<button class="btn btn-large btn-primary" type="submit">Sign in</button>
</form>

<cfdump var="#session#"/>
</cfoutput>	