<cfset request.layout = false />
<cfsilent>
	<cfscript>
		function className(before){
			return rereplace(before, '[^A-Za-z0-9]', '', 'ALL');
		}
	</cfscript>

	<cfquery name="qTracks">
		select
			trackName
			, primaryBG
			, primaryColor
			, secondaryBG
			, secondaryColor
		from
			tblTracks
	</cfquery>
	<cfcontent type="text/css" />
</cfsilent>
* {
	font-family: Verdana, Helvetica;
}

body {
	margin: 0;
	padding: 0;
}

h2, h3, h4 {
	margin: 0;
}

.day h2 {
	background-color: black;
	color: white;
	text-align: center;
	padding: 4px;
}

.timeslot h3 {
	background-color: #333;
	color: #fff;
	padding: 2px 4px;
}

.session {
	padding: 8px;
}

.track {
	width: auto;
	float: right;
	border-radius: 4px;
	padding: 4px 8px;
}

.location {
	font-style: italic;
	font-size: 0.8em;
}

<cfoutput query="qTracks">
.#className(qTracks.trackName)#.primary { background-color: #qTracks.primaryBG#; color: #qTracks.primaryColor#; }
.#className(qTracks.trackName)#.secondary { background-color: #qTracks.secondaryBG#; color: #qTracks.secondaryColor#; }
</cfoutput>