<cfparam name="local.prefill" default="#structNew()#" />
<cfparam name="local.prefill.trackId" default="" />
<cfparam name="local.prefill.trackName" default="" />
<cfparam name="local.prefill.primaryColor" default="##FFFFFF" />
<cfparam name="local.prefill.primaryBG" default="##000000" />
<cfparam name="local.prefill.secondaryColor" default="##000000" />
<cfparam name="local.prefill.secondaryBG" default="##EEEEEE" />

<cfoutput>
	<form method="post" action="#buildUrl('tracks.save')#" class="form-horizontal">

		<!--- blank value = insert, numeric = update --->
		<input type="hidden" name="trackId" value="#local.prefill.trackId#" />

		<div class="control-group">
			<label class="control-label" for="trackName">Track Name:</label>
			<div class="controls">
				<input type="text" name="trackName" id="trackName" placeholder="Track Name" value="#local.prefill.trackName#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="primaryBG">Primary BG Color:</label>
			<div class="controls">
				<input type="text" name="primaryBG" id="primaryBG" class="span1 colorpicker" placeholder="##000000" value="#local.prefill.primaryBG#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="primaryColor">Primary Text Color:</label>
			<div class="controls">
				<input type="text" name="primaryColor" id="primaryColor" class="span1 colorpicker" placeholder="##000000" value="#local.prefill.primaryColor#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="secondaryBG">Secondary BG Color:</label>
			<div class="controls">
				<input type="text" name="secondaryBG" id="secondaryBG" class="span1 colorpicker" placeholder="##555555" value="#local.prefill.secondaryBG#" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="secondaryColor">Secondary Text Color:</label>
			<div class="controls">
				<input type="text" name="secondaryColor" id="secondaryColor" class="span1 colorpicker" placeholder="##555555" value="#local.prefill.secondaryColor#" />
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<cfparam name="local.saveButton" default="Save Changes" />
				<button type="submit" class="btn btn-primary"><i class="icon-ok icon-white"></i> #local.saveButton#</button>
				<a href="#buildUrl('tracks.list')#" class="btn"><i class="icon-remove"></i> Cancel</a>
			</div>
		</div>
	</form>
</cfoutput>
