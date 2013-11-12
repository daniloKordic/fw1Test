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
				<ul class="thumbnails">
					<cfloop query="#rc.products#">
						<cfif CategoryUID eq fCategoryUID>						
							<li class="span6" <cfif rc.products.currentRow mod 2 neq 0>style="margin-left:0;"</cfif>>
						   	<div class="thumbnail">
							   	<img data-src="holder.js/300x200" alt="">
							   	<h3>Thumbnail label</h3>
							   	<p>Thumbnail caption...</p>
						   	</div>
							</li>
						</cfif>
					</cfloop>
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
<cfdump var="#rc.products#"/>
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