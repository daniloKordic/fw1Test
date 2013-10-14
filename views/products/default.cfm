<cfoutput>

Products List


<div class="btn-toolbar">
    <button class="btn btn-primary">New Product</button>
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
	              <a href="##" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
	          </td>
	        </tr>	
      	</cfloop>
      </tbody>
    </table>
</div>
<div class="pagination">
    <ul>
        <li><a href="##">Prev</a></li>
        <li><a href="##">1</a></li>
        <li><a href="##">2</a></li>
        <li><a href="##">3</a></li>
        <li><a href="##">4</a></li>
        <li><a href="##">Next</a></li>
    </ul>
</div>
<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Delete Confirmation</h3>
    </div>
    <div class="modal-body">
        <p class="error-text">Are you sure you want to delete the user?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
    </div>
</div>


<cfdump var="#rc#" />

<cfdump var="#session#" />

</cfoutput>