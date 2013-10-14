<cfoutput>

	<cfset fProductUID = ""/>
	<cfset fProductName = ""/>
	<cfset fProductDescription = ""/>
	<cfset fIsActive = 0 />

	<cfif isDefined("rc.event.product.ProductUID") and rc.event.product.ProductUID neq ""><cfset fProductUID="#rc.event.product.ProductUID#"/></cfif>
	<cfif isDefined("rc.event.product.ProductName") and rc.event.product.ProductName neq ""><cfset fProductName="#rc.event.product.ProductName#"/></cfif>
	<cfif isDefined("rc.event.product.ProductDesription") and rc.event.product.ProductDescription neq ""><cfset fProductDescription="#rc.event.product.ProductDescription#"/></cfif>
	<cfif isDefined("rc.event.product.active") and rc.event.product.active neq ""><cfset fIsActive="#rc.event.product.active#"/></cfif>
		
	

	<form class="form-horizontal" action="#buildUrl('products.manage')#" method="POST" id="manageProduct" name="manageProduct">
		<input type="hidden" id="fsw" name="fsw" value=""/>
		<input type="hidden" id="productUID" name="productUID" value="#fProductUID#" />
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
			 <label class="radio inline" for="active-0">
			   <input name="radios" id="radios-0" value="0" <cfif fIsActive eq 1>checked</cfif> type="radio">
			   Yes
			 </label>
			 <label class="radio inline" for="active-1">
			   <input name="radios" id="radios-1" value="1" type="radio" <cfif fIsActive eq 0>checked</cfif>>
			   No
			 </label>
			</div>
		</div>

		<div class="control-group">
			<!-- Button -->
			<div class="controls">
				<button class="btn btn-success" name="updateProduct" id="updateProduct">Save</button>
			</div>
		</div>
		</fieldset>
	</form>


	<script type="text/javascript">

		$(document).ready(function() {
			$("##updateProduct").click(function() {
				if (validateForm()) {
					$("##fsw").val("update");
					submitForm();
				}
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