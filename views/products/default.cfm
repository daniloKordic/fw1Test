<cfoutput>

<script type="text/javascript">
	$(document).ready(function() {
		$("##newProduct").click(function() {
			document.location="index.cfm?action=products.manage";
		});
		$("##backBtn").click(function() {
			document.location="index.cfm";
		});
	});
</script>

<cfif isDefined("rc.event.result.message")>
  <div class="alert alert-info expired">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    #rc.event.result.message#
  </div>
</cfif>

Products List

<div class="btn-toolbar">
    <button class="btn btn-primary" id="newProduct" name="newProduct">New Product</button>
    <button class="btn btn-default" id="backBtn" name="backBtn" type="button">Back</button>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>##</th>
          <th>Product Name</th>
          <th>Product Description</th>
          <th>Is Active?</th>
          <th style="width: 36px;"></th>
        </tr>
      </thead>
      <tbody>
      	<cfloop query="rc.qGrid">
      		<tr>
	          <td>#rc.qGrid.currentRow#</td>
	          <td>#ProductName#</td>
	          <td>#ProductDescription#</td>
	          <td>#active#</td>
	          <td>
	              <a href="index.cfm?action=products.manage&uid=#ProductUID#"><i class="icon-pencil"></i></a>
	          </td>
	        </tr>	
      	</cfloop>
      </tbody>
    </table>
</div>

</cfoutput>