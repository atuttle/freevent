<cfoutput>
	<cfif structKeyExists(rc, "msg")>
		<div class="alert alert-success">#rc.msg#</div>
	</cfif>

	<a href="#buildUrl('tracks.new')#" class="btn btn-success"><i class="icon-plus icon-white"></i> New Track</a>
	<br/><br/>
</cfoutput>

<table class="table table-striped table-condensed table-fixed-header" style="width:auto">
	<thead class="header">
		<tr>
			<th>Actions</th>
			<th>Track Name</th>
			<th>Primary Color</th>
			<th>Secondary Color</th>
			<th>CSS Class Name</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="rc.trackQuery">
		<tr>
			<td>
				<a class="btn btn-warning btn-small" href="#buildUrl(action='tracks.edit', queryString='id='& rc.trackQuery.trackId)#"><i class="icon-pencil icon-white"></i></a>
			</td>
			<td>#rc.trackQuery.trackName#</td>
			<td style="background-color: #rc.trackQuery.primaryBG#; color: #rc.trackQuery.primaryColor#">Text Color</td>
			<td style="background-color: #rc.trackQuery.secondaryBG#; color: #rc.trackQuery.secondaryColor#">Text Color</td>
			<td>#className(rc.trackQuery.trackName)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>

<cfscript>
	function className(before){
		return rereplace(before, '[^A-Za-z0-9]', '', 'ALL');
	}
</cfscript>