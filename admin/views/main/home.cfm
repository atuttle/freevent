<cfparam name="rc.username" default="" />

<cfoutput>
	<cfif structKeyExists(rc, "error")>
		<div class="alert alert-error">#rc.error#</div>
	</cfif>

	<form method="post" action="#buildUrl('main.home')#" class="form-horizontal">
		<div class="control-group">
			<label class="control-label" for="username">Username:</label>
			<div class="controls">
				<input type="text" name="username" id="username" value="#rc.username#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="password">Password:</label>
			<div class="controls">
				<input type="password" id="password" name="password" />
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<label for="remember">
					<input type="checkbox" name="remember" id="remember" value="1" />
					Remember me
				</label>
				<button type="submit" class="btn">Login</button>
			</div>
		</div>
	</form>

</cfoutput>