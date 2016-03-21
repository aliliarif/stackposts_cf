<cfcomponent>
	<cffunction name="getPosts" returntype="query" hint="get RSS feeds from stackoverflow.com with tag coldfusion, returns query with 30 latest feed">
		<cfset rssUrl = 'http://stackoverflow.com/feeds/tag/coldfusion'>
		<cffeed action='read' source='#rssUrl#' query='qPosts'> <!--- stackoverflow posts --->
		<cfreturn qPosts>
	</cffunction>

	<cffunction name="getSavedPosts" returntype="query" hint="select all saved feeds from DB">
		<cfquery name="qGetSavedPosts" datasource="stackoverflow">
			select
				id,
				title,
				tags,
				DATE_FORMAT(publisheddate,'%d/%m/%Y %H:%i') publisheddate,
				DATE_FORMAT(saveddate,'%d/%m/%Y %H:%i') saveddate,
				posted_by,
				post_link
			from 
				so_posts
		</cfquery>
		<cfreturn qGetSavedPosts>
	</cffunction>

	<cffunction name="getSavedPosts_array" returntype="array" hint="select saved feeds from DB, return array - used to define the state of 'Save' button in index.cfm">
		<cfquery name="qGetSavedPosts" datasource="stackoverflow">
			select
				id,
				title,
				tags,
				publisheddate,
				saveddate
			from 
				so_posts
		</cfquery>
		<cfreturn qGetSavedPosts>
	</cffunction>
</cfcomponent>