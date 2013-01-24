<cfparam name="local.prefill" default="#structNew()#" />
<cfparam name="local.prefill.sessionId" default="" />
<cfparam name="local.prefill.startTime" default="" />
<cfparam name="local.prefill.endTime" default="" />
<cfparam name="local.prefill.location" default="" />
<cfparam name="local.prefill.title" default="" />
<cfparam name="local.prefill.descr" default="" />
<cfparam name="local.prefill.htmldescr" default="" />
<cfparam name="local.prefill.speaker" default="" />
<cfparam name="local.prefill.sortval" default="1" />
<cfparam name="local.prefill.active" default="1" />

<cfoutput>
	<form method="post" action="#buildUrl('sessions.save')#" class="form-horizontal">

		<!--- blank value = insert, numeric = update --->
		<input type="hidden" name="sessionId" value="#local.prefill.sessionId#" />

		<div class="control-group">
			<label class="control-label" for="startTime">Start Time:</label>
			<div class="controls">
				<cfset local.formattedStartTime = dateFormat(local.prefill.startTime, 'YYYY-MM-DD') & ' ' & timeFormat(local.prefill.startTime, 'hh:mm tt') />
				<input type="text" class="date-time-picker" name="startTime" id="startTime" placeholder="1/18/2013 8:00 am" value="#local.formattedStartTime#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="endTime">End Time:</label>
			<div class="controls">
				<cfset local.formattedEndTime = dateFormat(local.prefill.endTime, 'YYYY-MM-DD') & ' ' & timeFormat(local.prefill.endTime, 'hh:mm tt') />
				<input type="text" class="date-time-picker" name="endTime" id="endTime" placeholder="1/18/2013 8:00 am" value="#local.formattedEndTime#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="location">Location:</label>
			<div class="controls">
				<input type="text" name="location" id="location" placeholder="Location" value="#local.prefill.location#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="title">Title:</label>
			<div class="controls">
				<input type="text" name="title" id="title" class="span7" placeholder="Title" value="#local.prefill.title#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="htmldescr">Description:</label>
			<div class="controls">
				<textarea name="htmldescr" id="htmldescr" rows="5" class="wizzywig span7">#htmleditformat(local.prefill.htmldescr)#</textarea>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="speaker">Speaker(s):</label>
			<div class="controls">
				<input type="text" name="speaker" id="speaker" placeholder="Speaker(s)" value="#local.prefill.speaker#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="track">Track:</label>
			<div class="controls">
				<select id="track" name="track">
					<cfloop query="rc.trackQuery">
						<option value="#htmlEditFormat(rc.trackQuery.trackName)#">#htmlEditFormat(rc.trackQuery.trackName)#</option>
					</cfloop>
				</select>
				<!--- <input type="text" name="track" id="track" placeholder="Track" value="#local.prefill.track#" /> --->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="sortVal">Sort:</label>
			<div class="controls">
				<input type="text" name="sortVal" id="sortVal" placeholder="Sort" value="#local.prefill.sortVal#" />
			</div>
		</div>
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
				<a href="#buildUrl('sessions.list')#" class="btn"><i class="icon-remove"></i> Cancel</a>
			</div>
		</div>
	</form>
</cfoutput>
