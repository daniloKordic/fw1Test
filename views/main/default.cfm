<cfoutput>
	<cfset userUID=""/>
	<cfset fullName = "Guest" />
	<cfset usertype= 2 />

	<cfif structKeyExists(session.auth, "user")>
		<cfset userUID = session.auth.user.getUID() />
		<cfset fullName = session.auth.user.getFirstName() & ' ' & session.auth.user.getLastName() />
		<cfset usertype = session.auth.user.getTypeID() />
	</cfif>	

	<cfif isDefined("rc.message") and rc.message neq "">
		<div class="alert alert-info expired">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			#rc.message#
		</div>
	</cfif>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<h2 class="form-signin-heading">Welcome #fullName#</h2>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3 menu">
				<div class="accordion" id="accordion-628013">
					<div class="accordion-group">
						<div class="accordion-heading">
							 <a class="accordion-toggle" data-toggle="collapse" data-parent="##accordion-628013" href="##accordion-element-790247">Collapsible Group Item ##1</a>
						</div>
						<div id="accordion-element-790247" class="accordion-body collapse">
							<div class="accordion-inner">
								Anim pariatur cliche...
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							 <a class="accordion-toggle" data-toggle="collapse" data-parent="##accordion-628013" href="##accordion-element-141063">Collapsible Group Item ##2</a>
						</div>
						<div id="accordion-element-141063" class="accordion-body collapse">
							<div class="accordion-inner">
								Anim pariatur cliche...
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="span9 content">
				CONTENT
			</div>
		</div>
		<div class="row-fluid footer">
			<div class="span4 footerColumn footerLeft">
				FOOTER1
			</div>
			<div class="span4 footerColumn footerCenter">
				FOOTER2
			</div>
			<div class="span4 footerColumn footerRight">
				FOOTER3
			</div>
		</div>
	</div>

</cfoutput>