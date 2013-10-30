<cfoutput>

<script type="text/javascript">
	$(document).ready(function() {
		$("##newCategory").click(function() {
			document.location="index.cfm?action=categories.manage";
		});
		$("##backBtn").click(function() {
			document.location="index.cfm";
		});
	});

  function deleteCategory(uid) {
    $("##categoryUID").val(uid);
    $("##fsw").val("delete");

    $("##manageCategories").submit();
  }
</script>

<cfif isDefined("rc.event.result.message") and rc.event.result.message neq "">
  <div class="alert alert-info expired">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    #rc.event.result.message#
  </div>
</cfif>

  <h2>Categories Management</h2>

  <form class="form-horizontal" action="#buildUrl('categories.manage')#" method="POST" id="manageCategories" name="manageCategories">
    <input type="hidden" id="fsw" name="fsw" value=""/>
    <input type="hidden" id="categoryUID" name="categoryUID" value="" />
    
    <div class="well">
        <table class="table">
          <thead>
            <tr>
              <th>##</th>
              <th>Category Name</th>
              <th>Category Description</th>
              <th>Parent</th>
              <th style="width: 36px;"></th>
            </tr>
          </thead>
          <tbody>
          	<cfloop query="rc.qGrid">
          		<tr>
    	          <td>#rc.qGrid.currentRow#</td>
    	          <td>#CategoryName#</td>
    	          <td>#CategoryDetails#</td>
    	          <td>#ParentUID#</td>
    	          <td>
    	              <a href="index.cfm?action=categories.manage&uid=#CategoryUID#"><i class="icon-pencil"></i></a>
                    <a href="##" onClick="deleteCategory('#CategoryUID#')"><i class="icon-remove"></i></a>
    	          </td>
    	        </tr>	
          	</cfloop>
          </tbody>
        </table>
    </div>
  </form>
</cfoutput>