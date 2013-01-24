<cfoutput>
	<cfif structKeyExists(rc, "msg")>
		<div class="alert alert-success">#rc.msg#</div>
	</cfif>

	<a href="#buildUrl('sessions.new')#" class="btn btn-success"><i class="icon-plus icon-white"></i> New Session</a>
	<br/><br/>
</cfoutput>

<table class="table table-striped table-condensed table-fixed-header">
	<thead class="header">
		<tr>
			<th>Actions</th>
			<th>Active</th>
			<th>Starts</th>
			<th>Ends</th>
			<th>Location</th>
			<th>Track</th>
			<th>Title</th>
			<th>Description</th>
			<th>Speaker</th>
			<th>Sort</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="rc.sessionQuery">
		<tr>
			<td>
				<a class="btn btn-warning btn-small" href="#buildUrl(action='sessions.edit', queryString='id='& rc.sessionQuery.sessionId)#"><i class="icon-pencil icon-white"></i></a>
			</td>
			<td class="#(rc.sessionQuery.active eq 1) ? 'cell-yes' : 'cell-no'#">
				<cfif rc.sessionQuery.active eq 1>
					<i class="icon-ok"></i>
				<cfelse>
					<i class="icon-remove"></i>
				</cfif>
			</td>
			<td>#dateFormat(rc.sessionQuery.startTime, 'MM/DD')# #lcase(timeFormat(rc.sessionquery.startTime, 'hh:mmtt'))#</td>
			<td>#dateFormat(rc.sessionQuery.endTime, 'MM/DD')# #lcase(timeFormat(rc.sessionquery.endTime, 'hh:mmtt'))#</td>
			<td>#rc.sessionQuery.location#</td>
			<td>#rc.sessionQuery.track#</td>
			<td>#rc.sessionQuery.title#</td>
			<td>#rc.sessionQuery.descr#</td>
			<td>#rc.sessionQuery.speaker#</td>
			<td>#rc.sessionQuery.sortVal#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
