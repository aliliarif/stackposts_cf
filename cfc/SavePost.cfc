<cfcomponent>
	<cffunction name="savePost" access="remote" output="false" returntype="boolean" returnformat="plain" hint="saves posts to DB, called from AJAX function in scripts.cfm">
		<cfargument name="postID" type="string" required="true">
		<cfargument name="postTitle" type="string" required="true">
		<cfargument name="postTags" type="string" required="true">
		<cfargument name="postPublished" type="date" required="true">
		<cfargument name="postPostedBy" type="string" required="true">
		<cfargument name="postLink" type="string" required="true">
		<cfset publisheddate = dateTimeFormat(#postPublished#,'yyyy-mm-dd HH:nn')>

		<cftry>
			<cfquery name="qinsPost" datasource="stackoverflow">
				INSERT INTO so_posts
				(
					id,
					title,
					tags,
					publisheddate,
					saveddate,
					posted_by,
					post_link
				)
				VALUES
				(
					'#postID#',
					'#postTitle#',
					'#postTags#',
					'#publisheddate#',
					now(),
					'#postPostedBy#',
					'#postLink#'
				)
			</cfquery> 
			<cfreturn true>
			<cfcatch type="Database"> 
	        	<h1>Database Error</h1> 
	        	<cfoutput> 
		    		<ul> 
		            	<li><b>Message:</b> #cfcatch.Message# 
		            	<li><b>Native error code:</b> #cfcatch.NativeErrorCode# 
		            	<li><b>SQLState:</b> #cfcatch.SQLState# 
		            	<li><b>Detail:</b> #cfcatch.Detail# 
		        	</ul> 
	        	</cfoutput> 
        		<cfreturn false>
   	 		</cfcatch> 
		</cftry>
	</cffunction>
</cfcomponent>