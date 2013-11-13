<cfoutput>
	<cfset userUID=""/>
	<cfset fullName = "Guest" />	
	<cfset usertype= 2 />
	<cfset fCategoryUID = ""/>

	<cfif structKeyExists(session.auth, "user")>
		<cfset userUID = session.auth.user.getUID() />
		<cfset fullName = session.auth.user.getFirstName() & ' ' & session.auth.user.getLastName() />
		<cfset usertype = session.auth.user.getTypeID() />
	</cfif>	

	<cfif isDefined("rc.message") and rc.message neq "">
		<div class="alert alert-info expired">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			#rc.message#
		</div>
	</cfif>
	<!--- <cfif isDefined("rc.uid") and rc.uid neq "">
		<cfset fCategoryUID="#rc.uid#" />
	</cfif> --->
	
	<cfif isDefined("rc.cuid") and rc.cuid neq "">
		<cfset fCategoryUID = "#rc.cuid#" />
	</cfif>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<h2 class="form-signin-heading">Welcome #fullName#</h2>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3 menu">

				<div class="well" style="padding: 8px 0;">
				    <div style="overflow-y: scroll; overflow-x: hidden; height: 430px;">
				        <ul class="nav nav-list">
				        		<cfloop query="#rc.categories#">
				        			<cfif parentUID eq "">
				        				<cfset tCategoryUID = CategoryUID />
				        				<cfif hasChildren neq 0>	
				        					<li><label class="tree-toggler nav-header">#CategoryName#</label>			  					
						        				<ul class="nav nav-list tree">
							        				<cfloop query="#rc.categories#">
							        					<cfif ParentUID eq tCategoryUID>						        						
							        						<cfset ttCategoryUID=CategoryUID />
							                    		<cfif hasChildren neq 0>
							                    			<li><label class="tree-toggler nav-header">#CategoryName#</label>
								                    			<ul class="nav nav-list tree">
								                    				<cfloop query="#rc.categories#">
								                    					<cfif ParentUID eq ttCategoryUID>
								                    						<cfset tttCategoryUID= CategoryUID />
								                    						<cfif hasChildren eq 0>							                    							
								                    							<li <cfif fCategoryUID eq tttCategoryUID>class="selected"</cfif>><a href="index.cfm?main&cuid=#tttCategoryUID#">#CategoryName#</a></li>
								                    						<cfelse>
								                    							<li><label class="tree-toggler nav-header">#CategoryName#</label>
												                    			<ul class="nav nav-list tree">
												                    				<cfloop query="#rc.categories#">
												                    					<cfif ParentUID eq tttCategoryUID>
												                    						<cfset ttttCategoryUID= CategoryUID />         		
												                    						<li <cfif fCategoryUID eq ttttCategoryUID>class="selected"</cfif>><a href="index.cfm?main&cuid=#tttCategoryUID#">#CategoryName#</a></li>
												                    					</cfif>
												                    				</cfloop>
												                    			</ul>
								                    						</cfif>
								                    					</cfif>
								                    				</cfloop>
								                    			</ul>
								                    		</li>
							                    		<cfelse>
							                    			<li <cfif fCategoryUID eq ttCategoryUID>class="selected"</cfif>><a href="index.cfm?main&cuid=#ttCategoryUID#">#CategoryName#</a></li>
							                    		</cfif>
							        					</cfif>
							        				</cfloop>
						        				</ul>	
						        			<cfelse>
						        				<li <cfif fCategoryUID eq tCategoryUID>class="selected"</cfif>><a href="index.cfm?main&cuid=#tCategoryUID#">#CategoryName#</a></li>
						        			</cfif>
						        		</li>	        	
				        				<li class="divider"></li>					        				
				        			</cfif>
				        		</cfloop>
				        </ul>
				    </div>
				</div>
			</div>
			<div class="span6 content">
				<ul class="thumbnails span12" style="float:left;">
					<cfif rc.products.recordCount neq 0>					
						<cfloop query="#rc.products#">						
							<cfif CategoryUID eq fCategoryUID>						
								<li class="span4" <cfif rc.products.currentRow mod 3 neq 0 and rc.products.currentRow mod 3 neq 2>style="margin-left:0;"</cfif>>
							   	<div class="thumbnail">
							   		<cfif mainImage neq "">
							   			<a href="index.cfm?action=products.view&uid=#ProductUID#">
							   				<img src="#application.ImagesDirRel##mainImage#" style="width:100%;" alt="">	
							   			</a>
							   		</cfif>							   	
								   	<h4>#ProductName# #rc.products.currentRow#</h4>
								   	<p><cfif len(ProductDescription) gt 40>#left("#ProductDescription#", 37)#...<cfelse>#ProductDescription#</cfif></p>
							   	</div>
								</li>
								<cfif rc.products.currentRow mod 3 eq 0><div class="clear"></div></cfif>
							<cfelseif fCategoryUID eq "">
								<li class="span4" <cfif rc.products.currentRow mod 3 neq 0 and rc.products.currentRow mod 3 neq 2>style="margin-left:0;"</cfif>>
							   	<div class="thumbnail">
							   		<cfif mainImage neq "">
							   			<a href="index.cfm?action=products.view&uid=#ProductUID#">
							   				<img src="#application.ImagesDirRel##mainImage#" style="width:100%;" alt="">	
							   			</a>
							   		</cfif>							   	
								   	<h4>#ProductName# - #rc.products.currentRow#</h4>
								   	<p><cfif len(ProductDescription) gt 40>#left("#ProductDescription#", 37)#...<cfelse>#ProductDescription#</cfif></p>
							   	</div>
								</li>
								<cfif rc.products.currentRow mod 3 eq 0><div class="clear"></div></cfif>
							</cfif>
						</cfloop>
					<cfelse>
						<li class="span12" style="text-align:center;min-height:400px;vertical-align:middle;padding-top:100px;">
							<h2>No products</h2>
						</li>
					</cfif>
				</ul>
			</div>
			<div class="span3 news">
				NEWS
			</div>
		</div>
		<div class="row-fluid footer">
			<div class="span4 footerColumn footerLeft">
				FOOTER1
			</div>
			<div class="span4 footerColumn footerCenter">
				FOOTER2
			</div>
			<div class="span4 footerColumn footerRight">
				FOOTER3
			</div>
		</div>
	</div>

<script type="text/javascript">
	$(document).ready(function () {
		$('label.tree-toggler').click(function () {
			$(this).parent().children('ul.tree').toggle(300);
		});
	  $('label.tree-toggler').trigger('click');

	  $('.selected').parent().parent().parent().parent().parent().children('ul.tree').toggle(300);
	  $('.selected').parent().parent().parent().parent().children('ul.tree').toggle(300);
	  $('.selected').parent().parent().parent().children('ul.tree').toggle(300);
	  $('.selected').parent().parent().children('ul.tree').toggle(300);
	});	
</script>
</cfoutput>