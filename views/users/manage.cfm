<cfoutput>

	<cfset fUserUID="#rc.event.user.getUID()#" />
	<cfset fFirstName="#rc.event.user.getFirstName()#" />
	<cfset fLastName="#rc.event.user.getLastName()#" />
	<cfset fEmail="#rc.event.user.getEmail()#" />
	<cfset fUsername="#rc.event.user.getUsername()#"/>
	<cfset fPassword="#rc.event.user.getPassword()#" />

	<script type="text/javascript">

		$(document).ready(function(){
			$("##updateUser").click(function() {
				
				if (validateForm()) {					
					if ($("##userUID").val() == "") {
						$("##fsw").val("save");
					} else {
						$("##fsw").val("update");
					}
					$("##userRegister").submit();
					//submitForm();
				}
			});
			$("##deleteUser").click(function() {
				$("##fsw").val("delete");
				//submitForm();
				$("##userRegister").submit();
			});
			$("##backBtn").click(function() {
				document.location = "index.cfm?action=main";
			});
		});

		function cancel() {
			$("##firstName").val("#fFirstName#");
			$("##lastName").val("#fLastName#");
			$("##email").val("#fEmail#");
			$("##password").val("#fPassword#");
		}
		function validateForm() {
			var error = true;

			if ($("##username").val() == "") { error = false; $("##username").closest('.control-group').addClass('error'); }
			if ($("##password").val() == "") { error = false; $("##password").closest('.control-group').addClass('error'); }
			
			return error;
		}
		function submitForm() {
			$("##userRegister").submit();
		}
	</script>

	<cfif isDefined("rc.event.result.message") and rc.event.result.message neq "">
		<div class="alert alert-info expired">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			#rc.event.result.message#
		</div>
	</cfif>

	<form action="#buildUrl('users.manage')#" method="post" id="userRegister" name="userRegister" class="form-horizontal">
		<input type="hidden" id="fsw" name="fsw" value=""/>
		<input type="hidden" id="userUID" name="userUID" value="#fUserUID#"/>
		<fieldset>

			<!-- Form Name -->
			<legend>Edit user details</legend>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="firstName">First Name:</label>
			  <div class="controls">
			    <input id="firstName" name="firstName" placeholder="add your name" class="input-large" type="text" value="#fFirstName#">			    
			  </div>
			</div>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="lastname">Last Name:</label>
			  <div class="controls">
			    <input id="lastName" name="lastName" placeholder="add your last name" class="input-large" type="text" value="#fLastName#">
			    
			  </div>
			</div>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="email">Email:</label>
			  <div class="controls">
			    <input id="email" name="email" placeholder="add email" class="input-large" type="text" value="#fEmail#">			    
			  </div>
			</div>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="username">Username:</label>
			  <div class="controls">
			    <input id="username" name="username" placeholder="add username" class="input-large" type="text" value="#fUsername#">			    
			  </div>
			</div>

			<!-- Password input-->
			<div class="control-group">
			  <label class="control-label" for="password">Password:</label>
			  <div class="controls">
			    <input id="password" name="password" placeholder="add password" class="input-large" type="password" value="#fPassword#">			    
			  </div>
			</div>

			<div class="control-group">
				<!-- Button -->
				<div class="controls">
					<button type="button" class="btn btn-success" name="updateUser" id="updateUser"><cfif fUserUID eq "">Save<cfelse>Update</cfif></button>
					<button type="button" class="btn btn-danger" name="deleteUser" id="deleteUser">Delete</button>
					<button type="button" class="btn btn-default" name="backBtn" id="backBtn" type="button">Back</button>
				</div>
			</div>

		</fieldset>
	</form>

</cfoutput>