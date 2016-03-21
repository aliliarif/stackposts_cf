<cfcomponent>
	<cffunction name="cleanID" returntype="number" hint="get id number after last '/' in original post id returned from RSS (http://stackoverflow.com/q/xxxxxxx - returns only xxxxxxx )">
		<cfargument name="originalID" type="string" required="true">
		
		<cfset var cleanedID = ListLast(originalID,'/\') />
		<cfreturn cleanedID>
	</cffunction>

	<cffunction name="checkID" returntype="boolean" hint="check if ID already exists in DB, returns TRUE if exists">
		<cfargument name="originalID" type="number" required="true">
		
		<cfquery name="qCheckID" datasource="stackoverflow">
			select 
				count(*) count_id
			from 
				so_posts
			where
				id = #originalID#
		</cfquery>
		
		<cfif qCheckID.count_id neq 0>
			<cfreturn true>
		<cfelse>
			<cfreturn false>	
		</cfif>
	</cffunction>
</cfcomponent>