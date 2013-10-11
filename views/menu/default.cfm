<cfoutput>


<cfset fTypeID = #session.auth.TypeID# />

<script type="text/javascript">
	$(document).ready(function() {
		$("##addMenuItem").click(function(){
			document.location="index.cfm?action=menu.manage";
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
	
		<!--- <table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Menu Title</th>
					<th>Menu Item Level</th>
					<th>Sort</th>
				</tr>				
			</thead>
			<tbody>
				<tr>
					<td>123</td>
					<td>456</td>
					<td>789</td>
				</tr>
			</tbody>
		</table> --->
		

		<div class="bs-example">
	      <table class="table table-striped table-bordered">
	        <thead>
	          <tr>
	            <th>Menu Title</th>
	            <th>Menu Item Level</th>
	            <th>Sort</th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>1</td>
	            <td>Mark</td>
	            <td>Otto</td>
	          </tr>
	          <tr>
	            <td>2</td>
	            <td>Jacob</td>
	            <td>Thornton</td>
	          </tr>
	          <tr>
	            <td>3</td>
	            <td>Larry</td>
	            <td>the Bird</td>
	          </tr>
	        </tbody>
	      </table>
	    </div>
		
</cfif>


<cfdump var="#session#"/>

<cfdump var="#rc#"/>

</cfoutput>