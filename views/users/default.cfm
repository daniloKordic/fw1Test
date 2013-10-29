<cfoutput>

	<script type="text/javascript">
		$(document).ready(function() {
			$("##newUser").click(function() {
				document.location="index.cfm?action=users.manage";
			});
			$("##backBtn").click(function() {
				document.location="index.cfm";
			});
		});

		function deleteUser(userUID) {
			$("##userUID").val(userUID);
			$("##fsw").val("delete");

			$("##userRegister").submit();
		}
	</script>

	<cfif isDefined("rc.event.result.message") and rc.event.result.message neq "">
		<div class="alert alert-info expired">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			#rc.event.result.message#
		</div>
	</cfif>

	<h2>User Management</h2>

	<form action="#buildUrl('users.manage')#" method="post" id="userRegister" name="userRegister" class="form-horizontal">
		<input type="hidden" id="fsw" name="fsw" value=""/>
		<input type="hidden" id="userUID" name="userUID" value=""/>
		<div class="well">
			<table class="table">
				<thead>
					<tr>
						<th>##</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Username</th>
						<th>Password</th>
						<th style="width: 36px;"></th>
					</tr>
				</thead>
				<tbody>	
					<cfloop query="rc.qGrid">				
						<tr>
							<td>#rc.qGrid.currentRow#</td>
							<td>#FirstName#</td>
							<td>#LastName#</td>
							<td>#Email#</td>
							<td>#Username#</td>
							<td>#Password#</td>
							<td>
								<a href="index.cfm?action=users.manage&uid=#userUID#"><i class="icon-pencil"></i></a>
								<a href="##" onClick="deleteUser('#userUID#')"><i class="icon-remove"></i></a>
							</td>
						</tr>
					</cfloop>				
				</tbody>
			</table>
		</div>
	</form>

</cfoutput>