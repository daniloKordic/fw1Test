<cfoutput>

	<cfset fProductUID=""/>
	<cfset fProductName=""/>
	<cfset fProductDescription=""/>

	<cfif rc.product.recordCount neq 0>
		<cfset fProductUID="#rc.product.ProductUID#" />
		<cfset fProductName="#rc.product.ProductName#"/>
		<cfset fProductDescription="#rc.product.ProductDescription#"/>
	</cfif>

	<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
	    <div class="slides"></div>
	    <h3 class="title"></h3>
	    <a class="prev">&##171;</a>
	    <a class="next">&##187;</a>
	    <a class="close">&##215</a>
	    <a class="play-pause"></a>
	    <ol class="indicator"></ol>
	</div>

	<div id="links">
		<cfloop query="#rc.product#">
			<cfset imagesList = "#rc.product.images#" />
			<cfloop list="#imagesList#" index="ListItem" delimiters=",">
				<a href="Images/original/#ListItem#">
					<img src="Images/#ListItem#" >
				</a>
			</cfloop>
		</cfloop>
	</div>

	<div id="productInfo">
		<h2>#fProductName#</h2>
		<h4>#fProductDescription#</h4>
	</div>
	<script type="text/javascript">
		document.getElementById('links').onclick = function (event) {
		    event = event || window.event;
		    var target = event.target || event.srcElement,
		        link = target.src ? target.parentNode : target,
		        options = {index: link, event: event},
		        links = this.getElementsByTagName('a');
		    blueimp.Gallery(links, options);
		};
	</script>
	<style type="text/css">
		##links {
			text-align: center;
		}
		##links img {
			margin: 5px;
		}
		##productInfo{
			padding-left: 200px;
		}
	</style>

</cfoutput>