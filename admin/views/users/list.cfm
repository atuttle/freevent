<cfoutput>
	<cfif structKeyExists(rc, "msg")>
		<div class="alert alert-success">#rc.msg#</div>
	</cfif>

	<a href="#buildUrl('users.new')#" class="btn btn-success"><i class="icon-plus icon-white"></i> New User</a>
	<br/><br/>
</cfoutput>

<table class="table table-striped table-condensed table-fixed-header" style="width:auto">
	<thead class="header">
		<tr>
			<th>Actions</th>
			<th>Active</th>
			<th>Username</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="rc.userQuery">
		<tr>
			<td>
				<a class="btn btn-warning btn-small" href="#buildUrl(action='users.edit', queryString='id='& rc.userQuery.userId)#"><i class="icon-pencil icon-white"></i></a>
			</td>
			<td class="#(rc.userQuery.active eq 1) ? 'cell-yes' : 'cell-no'#">
				<cfif rc.userQuery.active eq 1>
					<i class="icon-ok"></i>
				<cfelse>
					<i class="icon-remove"></i>
				</cfif>
			</td>
			<td>#rc.userQuery.username#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
