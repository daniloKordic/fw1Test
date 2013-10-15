<cfoutput>

<cfset fTypeID = #session.auth.TypeID# />

<cfset fMenuItemUID = "#rc.event.menuItem.MenuItemUID#" />
<cfset fParentUID = "#rc.event.menuItem.ParentUID#" />
<cfset fMenuTitle = "#rc.event.menuItem.MenuTitle#" />
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
				submitForm();
			}
		});

		$("##cancelBtn").click(function() {
			$("##ParentItemUID").val("");
			$("##menuTitle").val("");
		});

		$("##backBtn").click(function() {
			document.location = "index.cfm";
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
		<fieldset>
			<input type="hidden" name="menuItemUID" id="menuItemUID" value="#fMenuItemUID#" />
		<!-- Form Name -->
		<legend>Add Menu Item</legend>

		<!-- Select Basic -->
		<div class="control-group">
		  <label class="control-label" for="ParentItemUID">Select Parent</label>
		  <div class="controls">
		    <select id="ParentItemUID" name="ParentItemUID" class="input-medium">
		    	<option value="">Please select</option>
		      <cfloop query="qParentMenus">
		      	<option value="#MenuItemUID#">#MenuTitle#</option>
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
		    <button id="backBtn" name="backBtn" class="btn btn-info" type="button">Back</button>
		  </div>
		</div>

		</fieldset>
		</form>
		
</cfif>

<cfdump var="#rc#"/>

</cfoutput>