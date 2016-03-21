<cfinclude template="global_header.cfm">
<cfinvoke component="cfc/getPosts" method="getSavedPosts" returnvariable="qSavedPosts"/>
<cfoutput>
	<div class="container" style="padding-top:30px;">
		<table class="table table-striped table-hover datatable" width="100%" >
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Posted on</th>
                <th>Saved on</th>
                <th>Tags</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        	<cfloop query="qSavedPosts">
        		<tr>
	                <td>#qSavedPosts.title#</td>
	                <td>#qSavedPosts.posted_by#</td>
	                <td>#qSavedPosts.publisheddate#</td>
	                <td>#qSavedPosts.saveddate#</td>
	                <td>#qSavedPosts.tags#</td>
	                <td>
	                	<a href="#qSavedPosts.post_link#" class="btn btn-primary btn-xs" target="_blank">Show</a>
	                </td>
            	</tr>
        	</cfloop>
        </tbody>
    </table>
    </div> 
</cfoutput>
<cfinclude template="global_footer.cfm">	