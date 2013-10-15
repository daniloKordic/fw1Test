<cfoutput>


<cfset fTypeID = #session.auth.TypeID# />

<script type="text/javascript">
	$(document).ready(function() {
		$("##addMenuItem").click(function(){
			document.location="index.cfm?action=menu.manage";
		});

		$("##backBtn").click(function() {
			document.location="index.cfm";
		});
	});
</script>

<style type="text/css">
	.bs-example {
	    background-color: ##FFFFFF;
	    border-color: ##DDDDDD;
	    border-radius: 4px 4px 0 0;
	    border-width: 1px;
	    box-shadow: none;
	    margin-left: 0;
	    margin-right: 0;
	    margin-top: 45px;
	    padding: 45px 15px 15px;
    	position: relative;
	}
	.bs-example:after {
	    color: darkgrey;
	    content: "Menu Items";
	    font-size: 12px;
	    font-weight: bold;
	    left: 15px;
	    letter-spacing: 1px;
	    position: absolute;
	    text-transform: uppercase;
	    top: 15px;
	}
</style>

<cfif fTypeID eq 1>
	<h2>Menu Management</h2>

	<button class="btn btn-primary" type="button" id="addMenuItem" name="addMenuItem">Add Menu Item</button>
	<button class="btn btn-default" id="backBtn" name="backBtn" type="button">Back</button>	
		
	<br/><br/>
	<div id="menuContainer">
		<cfquery name="getItems01" dbtype="query">
			select * from rc.menu where MenuItemLevel=1 order by Sort
		</cfquery>
		<ul>
			<cfloop query="getItems01">
				<cfset tMenuItemUID="#MenuItemUID#">
				<cfquery name="getChildren" dbtype="query">
					select * from rc.menu where MenuItemLevel=2 and ParentMenuItemUID='#tMenuItemUID#'
				</cfquery>
				<li <cfif getChildren.recordCount neq 0>class="withChildren"</cfif>>
					<a href="index.cfm?action=menu.manage&uid=#MenuItemUID#">#MenuTitle#</a>
					<cfif getChildren.recordCount neq 0>
						<ul>
							<cfloop query="getChildren">
								<cfset tMenuItemUID="#MenuItemUID#">
								<cfquery name="getChildren" dbtype="query">
									select * from rc.menu where MenuItemLevel=3 and ParentMenuItemUID='#tMenuItemUID#'
								</cfquery>
								<li <cfif getChildren.recordCount neq 0>class="withChildren"</cfif>>
									<a href="index.cfm?action=menu.manage&uid=#MenuItemUID#">#MenuTitle#</a>
									<cfif getChildren.recordCount neq 0>
										<ul>
											<cfloop query="getChildren">
												<li>
													<a href="index.cfm?action=menu.manage&uid=#MenuItemUID#">#MenuTitle#</a>
												</li>
											</cfloop>
										</ul>
									</cfif>
								</li>
							</cfloop>
						</ul>
					</cfif>
				</li>
			</cfloop>
		</ul>
	</div>
		
</cfif>
<br/><br/>

<cfdump var="#rc#"/>

<cfdump var="#session#"/>

</cfoutput>