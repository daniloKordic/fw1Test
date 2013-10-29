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

  function deleteProduct(uid) {
    $("##productUID").val(uid);
    $("##fsw").val("delete");

    $("##manageProduct").submit();
  }
</script>

<cfif isDefined("rc.event.result.message") and rc.event.result.message neq "">
  <div class="alert alert-info expired">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    #rc.event.result.message#
  </div>
</cfif>

  <h2>Products Management</h2>

  <form class="form-horizontal" action="#buildUrl('products.manage')#" method="POST" id="manageProduct" name="manageProduct">
    <input type="hidden" id="fsw" name="fsw" value=""/>
    <input type="hidden" id="productUID" name="productUID" value="" />
    
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
                    <a href="##" onClick="deleteProduct('#ProductUID#')"><i class="icon-remove"></i></a>
    	          </td>
    	        </tr>	
          	</cfloop>
          </tbody>
        </table>
    </div>
  </form>
</cfoutput>