<cfoutput>

	<cfset fUserUID="#rc.event.user.getUID()#" />
	<cfset fFirstName="#rc.event.user.getFirstName()#" />
	<cfset fLastName="#rc.event.user.getLastName()#" />
	<cfset fEmail="#rc.event.user.getEmail()#" />
	<cfset fUsername="#rc.event.user.getUsername()#"/>
	<cfset fPassword="#rc.event.user.getPassword()#" />
	<cfset fActive="#rc.event.user.getIsActive()#"/>

	<script type="text/javascript">

		$(document).ready(function(){

			$('##userRegister').validate(
			{
				rules: {
					email: {
						required: true,
						email: true
					},
					username: {
						minlength: 6,
						required: true
					},
					password: {
						minlength: 6,
						required: true
					}
				},
				highlight: function(element) {
					$(element).closest('.control-group').removeClass('success').addClass('error');
				},
				success: function(element) {
					element.text('OK!').addClass('valid').closest('.control-group').removeClass('error').addClass('success');
				}
			});

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
				<cfif session.auth.TypeID eq 1>
					document.location = "index.cfm?action=users";
				<cfelse>
					document.location = "index.cfm?action=main";
				</cfif>
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

	<style type="text/css">
		label.valid {
			width: 24px;
			height: 24px;
			background: url(assets/img/valid.png) center center no-repeat;
			display: inline-block;
			text-indent: -9999px;
		}
		label.error {
			font-weight: bold;
			color: red;
			padding: 2px 8px;
			margin-top: 2px;
		}
	</style>

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
			<cfif fUserUID neq "">
				<legend>Edit user details</legend>
			<cfelse>	
				<legend>Add user details</legend>
			</cfif>
			

			<!-- Text input-->
			<div class="control-group">
				<label class="control-label" for="firstName">Photo:</label>
			  	<div class="controls">
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
				</div>
			</div>

			<div class="control-group">
			  <label class="control-label" for="firstName">First Name:</label>
			  <div class="controls">
			    <input id="firstName" name="firstName" class="input-large" type="text" value="#fFirstName#">			    
			  </div>
			</div>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="lastname">Last Name:</label>
			  <div class="controls">
			    <input id="lastName" name="lastName" class="input-large" type="text" value="#fLastName#">		    
			  </div>
			</div>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="email">Email:</label>
			  <div class="controls">
			    <input id="email" name="email" class="input-large" type="text" value="#fEmail#">			    
			  </div>
			</div>

			<!-- Text input-->
			<div class="control-group">
			  <label class="control-label" for="username">Username:</label>
			  <div class="controls">
			    <input id="username" name="username" class="input-large" type="text" value="#fUsername#">		    
			  </div>
			</div>

			<!-- Password input-->
			<div class="control-group">
			  <label class="control-label" for="password">Password:</label>
			  <div class="controls">
			    <input id="password" name="password" class="input-large" type="password" value="#fPassword#">	    
			  </div>
			</div>

			<cfif session.auth.TypeID eq 1>
				<div class="control-group">
				  <label class="control-label" for="radios">User Status</label>
				  <div class="controls">
				    <label class="radio" for="radios-0">
				      <input name="active" id="radios-0" value="1" type="radio" <cfif fActive eq 1>checked</cfif>>
				      Active
				    </label>
				    <label class="radio" for="radios-1">
				      <input name="active" id="radios-1" value="0" type="radio" <cfif fActive eq 0>checked</cfif>>
				      Inactive
				    </label>
				  </div>
				</div>
			</cfif>

			<div class="control-group">
				<!-- Button -->
				<div class="controls">
					<button type="submit" class="btn btn-success" name="updateUser" id="updateUser"><cfif fUserUID eq "">Save<cfelse>Update</cfif></button>
					<cfif session.auth.TypeID eq 1>
						<button type="button" class="btn btn-danger" name="deleteUser" id="deleteUser">Delete</button>
					</cfif>					
					<button type="button" class="btn btn-default" name="backBtn" id="backBtn" type="button">Back</button>
				</div>
			</div>

		</fieldset>
	</form>

</cfoutput>