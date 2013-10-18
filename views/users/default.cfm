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
	</script>

	<cfif isDefined("rc.event.result.message") and rc.event.result.message neq "">
		<div class="alert alert-info expired">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			#rc.event.result.message#
		</div>
	</cfif>

	<div class="btn-toolbar">
	    <button class="btn btn-primary" id="newUser" name="newUser">New User</button>
	    <button class="btn btn-default" id="backBtn" name="backBtn" type="button">Back</button>
	</div>

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
						</td>
					</tr>
				</cfloop>				
			</tbody>
		</table>
	</div>

</cfoutput>