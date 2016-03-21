<cfinclude template="global_header.cfm">
<cfinvoke component="cfc/getPosts" method="getPosts" returnvariable="qPosts"/>
<cfoutput>
	<div class="container">
		<a href="savedPosts.cfm" class="btn btn-success btn-sm pull-right">Saved posts</a>
		<!--- <cfdump var="#qPosts#"> --->
      	<cfloop query="qPosts">
      		
      		<cfinvoke component="cfc/PostID" method="cleanID" returnvariable="cleanedID">
      			<cfinvokeargument name="originalID" value="#qPosts.id#">
      		</cfinvoke> 
      		<cfinvoke component="cfc/PostID" method="checkID" returnvariable="checkID">
      			<cfinvokeargument name="originalID" value="#cleanedID#">
      		</cfinvoke>

        	<cfif checkID>
        		<cfset button_class = "btn btn-success btn-xs pull-right">
        		<cfset button_text = "Saved">
        	<cfelse>
        		<cfset button_class = "btn btn-primary btn-xs pull-right savePost">
        		<cfset button_text = "Save">
        	</cfif>

	        <div class="">
	        	<a href="#qPosts.linkhref#" target="_blank" ><h3>#qPosts.title#</h3></a>
	        	<input type="hidden" class="postID" value="#cleanedID#">
	        	<input type="hidden" class="postTitle" value="#qPosts.title#">
	        	<input type="hidden" class="postTags" value="#qPosts.categoryterm#">
	        	<input type="hidden" class="postPublished" value="#qPosts.publisheddate#">
	        	<input type="hidden" class="postPostedBy" value="#qPosts.authorname#">
	        	<input type="hidden" class="postLink" value="#qPosts.linkhref#">
	          	<button type="button" id="#cleanedID#" class="#button_class#">#button_text#</button>
	          	<div class="tags">	
          			<cfif isArray(qPosts.categoryterm)>
          				<cfloop array="#qPosts.categoryterm#" index="tag">
  							<button type="button" class="btn btn-default btn-xs">#tag#</button>
  						</cfloop>
  					<cfelse>
  						<button type="button" class="btn btn-default btn-xs">#qPosts.categoryterm#</button>
          			</cfif>
	          	</div>
	          	<p>#qPosts.summary#</p>
	          	<i class="date_published pull-right">
	          		#dateTimeFormat(#qPosts.publisheddate#,'dd/mm/yyyy HH:nn')#
	          	</i>
	          	<br>
	        </div>
	        <hr>
        </cfloop>
    </div> 
</cfoutput>
<cfinclude template="global_footer.cfm">	
	




