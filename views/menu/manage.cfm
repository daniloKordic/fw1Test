<cfoutput>

<cfset fTypeID = #session.auth.TypeID# />

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

<cfif fTypeID eq 1>
	<h2>Menu Management</h2>

	<button class="btn btn-primary" type="button" id="backBtn" name="backBtn">Back</button>
	

		
</cfif>

<cfdump var="#rc#"/>

</cfoutput>