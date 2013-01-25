<cfsilent>
	<cfscript>
		function className(before){
			return rereplace(before, '[^A-Za-z0-9]', '', 'ALL');
		}
	</cfscript>
	<cfquery name="qSessions">
		select
			sessionId
			, startTime
			, endTime
			, sortVal
			, speaker
			, location
			, title
			, descr
			, htmldescr
			, track
			, date_format(startTime, '%W') as groupDayName
			, date_format(startTime, '%D') as groupDay
			, date_format(startTime, '%h:%i %p') as groupTime
		from
			tblSessions
		where
			active = 1
		order by
			startTime ASC
			, track ASC
			, sortVal ASC
	</cfquery>
</cfsilent>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Mobile Schedule</title>
		<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />
		<link rel="stylesheet" href="admin/index.cfm?action=mobile.css" />
	</head>
	<body>
		<cfoutput query="qSessions" group="groupDayName">

			<section class="day">
				<h2>#qSessions.groupDayName#, the #qSessions.groupDay#</h2>

				<cfoutput group="groupTime">

					<section class="timeslot">
						<h3>#qSessions.groupTime#</h3>

						<cfoutput>

							<section class='session #className(qSessions.track)# secondary'>
								<div class="track #className(qSessions.track)# primary">#qSessions.track#</div>
								<h4>#qSessions.title#</h4>
								<div class="speaker">#qSessions.speaker#</div>
								<div class="location">#qSessions.location#</div>
							</section>

						</cfoutput>

					</section>

				</cfoutput>

			</section>

		</cfoutput>
	</body>
</html>