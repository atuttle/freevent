<cfparam name="local.prefill" default="#structNew()#" />
<cfparam name="local.prefill.userId" default="" />
<cfparam name="local.prefill.username" default="" />
<cfparam name="local.prefill.active" default="1" />

<cfoutput>
	<form method="post" action="#buildUrl('users.save')#" class="form-horizontal">

		<!--- blank value = insert, numeric = update --->
		<input type="hidden" name="userId" value="#local.prefill.userId#" />

		<div class="control-group">
			<label class="control-label" for="username">Username:</label>
			<div class="controls">
				<input type="text" name="username" id="username" placeholder="username" value="#local.prefill.username#" />
			</div>
		</div>

		<cfif rc.action eq 'users.new'>
			<div class="control-group">
				<label class="control-label" for="password">Password:</label>
				<div class="controls">
					<input type="password" name="password" id="password" />
				</div>
			</div>
		</cfif>

		<div class="control-group">
			<div class="controls">
				<label for="active">
					<input type="checkbox" name="active" id="active" value="1" <cfif local.prefill.active eq 1>checked="checked"</cfif> />
					Active
				</label>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<cfparam name="local.saveButton" default="Save Changes" />
				<button type="submit" class="btn btn-primary"><i class="icon-ok icon-white"></i> #local.saveButton#</button>
				<a href="#buildUrl('users.list')#" class="btn"><i class="icon-remove"></i> Cancel</a>
			</div>
		</div>
	</form>


	<cfif rc.action eq 'users.edit'>
		<br/><br/><br/>
		<form method="post" action="#buildUrl('users.resetPassword')#" class="form-horizontal">

			<!--- blank value = insert, numeric = update --->
			<input type="hidden" name="userId" value="#local.prefill.userId#" />

			<div class="control-group">
				<label class="control-label" for="password">New Password:</label>
				<div class="controls">
					<input type="password" name="password" id="password" />
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary"><i class="icon-ok icon-white"></i> Reset Password</button>
				</div>
			</div>
		</form>
	</cfif>

</cfoutput>
