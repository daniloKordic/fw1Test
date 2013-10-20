<cfoutput>

	<cfset fProductUID="#rc.event.product.getProductUID()#"/>
	<cfset fProductName="#rc.event.product.getProductName()#"/>
	<cfset fProductDescription="#rc.event.product.getProductDescription()#"/>
	<cfset fIsActive="#rc.event.product.getActive()#"/>


	<form class="form-horizontal" action="#buildUrl('products.manage')#" method="POST" id="manageProduct" name="manageProduct">
		<input type="hidden" id="fsw" name="fsw" value=""/>
		<input type="hidden" id="productUID" name="productUID" value="#fProductUID#" />

		<cfif rc.event.result.message neq "" and rc.event.result.message neq "">
			<div class="alert alert-info expired">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				#rc.event.result.message#
			</div>
		</cfif>

		<fieldset>
			<div id="legend">
				<legend class="">Product Info</legend>
			</div>
		<div class="control-group">
			<!-- Username -->
			<label class="control-label" for="productName">Product Name</label>
			<div class="controls">
				<input type="text" id="productName" name="productName" placeholder="" value="#fProductName#" class="input-xlarge">
			</div>
		</div>

		<div class="control-group">
		<!-- E-mail -->
			<label class="control-label" for="productDescription">Product Description</label>
			<div class="controls">
				<input type="text" id="productDescription" name="productDescription" placeholder="" class="input-xlarge" value="#fProductDescription#">
			</div>
		</div>

		<!-- Multiple Radios (inline) -->
		<div class="control-group">
			<label class="control-label" for="active">Active</label>
			<div class="controls">
			 <label class="radio inline" for="radios-1">
			   <input name="active" id="radios-1" value="1" <cfif fIsActive eq 1>checked</cfif> type="radio">
			   Yes
			 </label>
			 <label class="radio inline" for="radios-0">
			   <input name="active" id="radios-0" value="0" type="radio" <cfif fIsActive eq 0>checked</cfif>>
			   No
			 </label>
			</div>
		</div>

		<div class="control-group">
			<!-- Button -->
			<div class="controls">
				<button type="button" class="btn btn-success" name="updateProduct" id="updateProduct"><cfif fProductUID eq "">Save<cfelse>Update</cfif></button>
				<button type="button" class="btn btn-danger" name="deleteProduct" id="deleteProduct">Delete</button>
				<button type="button" class="btn btn-default" name="backBtn" id="backBtn" type="button">Back</button>
			</div>
		</div>
		</fieldset>
	</form>


	<script type="text/javascript">

		$(document).ready(function() {
			$("##updateProduct").click(function() {
				if (validateForm()) {
					if ($("##productUID").val() == "") {
						$("##fsw").val("save");
					} else {
						$("##fsw").val("update");
					}
					//submitForm();
					$("##manageProduct").submit();
				}
			});

			$("##deleteProduct").click(function() {
				if (validateForm()) {
					$("##fsw").val("delete");
					//submitForm();
					$("##manageProduct").submit();
				}
			});

			$("##backBtn").click(function() {
				document.location = "index.cfm?action=products";
			});
		});

		function validateForm() {
			var error = true;

			if ($("##productName").val() == "") { error = false; $("##productName").closest('.control-group').addClass("error"); }

			return error;
		}

		function submitForm() {
			$("##manageProduct").submit();
		}
	</script>

</cfoutput>