<cfoutput>

<cfset fMenuItemUID=""/>
<cfset fParentUID=""/>
<cfset fMenuTitle=""/>
<cfset fHasChildren=0 />


<cfset fTypeID = #session.auth.TypeID# />

<cfset fMenuItemUID = "#rc.event.menuItem.getMenuItemUID()#" />
<cfset fParentUID = "#rc.event.menuItem.getParentMenuItemUID()#" />
<cfset fMenuTitle = "#rc.event.menuItem.getMenuTitle()#" />
<cfset fHasChildren = #rc.event.menuItem.getHasChildren()# />
<cfset qParentMenus = "#rc.event.Parents#" />

<script type="text/javascript">
	$(document).ready(function() {
		$("##backBtn").click(function(){
			document.location="index.cfm?action=menu";
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

<script type="text/javascript">
	$(document).ready(function() {
		$("##saveBtn").click(function() {
			if (validateForm()) {
				if ($("##menuItemUID").val() == "") {
					$("##fsw").val("save");
				} else {
					$("##fsw").val("update");
				}
				submitForm();
			}
		});

		$("##cancelBtn").click(function() {
			$("##ParentItemUID").val("#rc.event.menuItem.getParentMenuItemUID()#");
			$("##menuTitle").val("#rc.event.menuItem.getMenuTitle()#");
		});

		$("##deleteBtn").click(function() {
			$("##fsw").val("delete");
			submitForm();
		});

		$("##backBtn").click(function() {
			document.location = "index.cfm?action=menu";
		});
	});

	function validateForm() {
		return true;
	}

	function submitForm() {
		$("##manageMenu").submit();
	}
</script>

<cfif fTypeID eq 1>
	<h2>Menu Management</h2>

	<form class="form-horizontal"  action="#buildUrl('menu.manage')#" method="POST" id="manageMenu" name="manageMenu">
		<input type="hidden" name="menuItemUID" id="menuItemUID" value="#fMenuItemUID#" />
		<input type="hidden" name="hasChildren" id="hasChildren" value="#fHasChildren#" />
		<input type="hidden" id="fsw" name="fsw" value="" />

		<cfif rc.event.result.message neq "">
			<div class="alert alert-info expired">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				#rc.event.result.message#
			</div>
		</cfif>

		<fieldset>
		<!-- Form Name -->
		<legend>Add Menu Item</legend>

		<!-- Select Basic -->
		<div class="control-group">
		  <label class="control-label" for="parentMenuItemUID">Select Parent</label>
		  <div class="controls">
		    <select id="parentMenuItemUID" name="parentMenuItemUID" class="input-medium" <cfif fHasChildren eq 1>disabled</cfif>>
		    	<option value="">Please select</option>
		      <cfloop query="qParentMenus">
		      	<option value="#MenuItemUID#" <cfif fParentUID eq MenuItemUID >selected</cfif>>#MenuTitle#</option>
		      </cfloop>
		    </select>
		  </div>
		</div>

		<!-- Text input-->
		<div class="control-group">
		  <label class="control-label" for="menuTitle">Menu Title</label>
		  <div class="controls">
		    <input id="menuTitle" name="menuTitle" placeholder="menu item title" class="input-large" required="" type="text" value="#fMenuTitle#">		    
		  </div>
		</div>

		<!-- Button (Double) -->
		<div class="control-group">
		  <label class="control-label" for="saveBtn"></label>
		  <div class="controls">
		    <button id="saveBtn" name="saveBtn" class="btn btn-success" type="button">Save</button>
		    <button id="cancelBtn" name="cancelBtn" class="btn btn-danger" type="button">Cancel</button>
		    <button id="deleteBtn" name="deleteBtn" class="btn btn-danger" type="button">Delete</button>
		    <button id="backBtn" name="backBtn" class="btn btn-info" type="button">Back</button>
		  </div>
		</div>

		</fieldset>
		</form>
		
</cfif>

<cfdump var="#rc#"/>

</cfoutput>