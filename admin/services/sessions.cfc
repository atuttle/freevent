component {

	function list(){
		local.q = new Query();

		q.setSql("
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
				, active
			from
				tblSessions
			order by
				startTime ASC
				, sortVal ASC
		");

		return q.execute().getResult();
	}

	function get(id){
		local.q = new Query();

		q.setSql("
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
				, active
			from
				tblSessions
			where
				( sessionId = :id )
		");
		q.addParam(name="id", value=arguments.id);

		return q.execute().getResult();
	}

	function insert(startTime, endTime, location, title, htmldescr, descr, speaker, track, sortVal, active){
		local.q = new Query();

		arguments.active = (arguments.active eq true or arguments.active eq 'yes') ? 1 : 0;

		q.setSql("
			insert into
				tblSessions
				( startTime, endTime, sortVal, speaker, location, title, descr, htmldescr, track, active )
			values
				( :start, :end, :sort, :speaker, :location, :title, :descr, :htmldescr, :track, :active )
		");
		q.addParam(name="start", value=arguments.startTime);
		q.addParam(name="end", value=arguments.endTime);
		q.addParam(name="sort", value=arguments.sortVal);
		q.addParam(name="speaker", value=arguments.speaker);
		q.addParam(name="location", value=arguments.location);
		q.addParam(name="title", value=arguments.title);
		q.addParam(name="descr", value=arguments.descr);
		q.addParam(name="htmldescr", value=arguments.htmldescr);
		q.addParam(name="track", value=arguments.track);
		q.addParam(name="active", value=arguments.active, cfsqltype="cf_sql_bit");

		return q.execute().getResult();
	}

	function update(sessionId, startTime, endTime, location, title, htmldescr, descr, speaker, track, sortVal, active){
		local.q = new Query();

		arguments.active = (arguments.active eq true or arguments.active eq 'yes') ? 1 : 0;

		q.setSql("
			update
				tblSessions
			set
				startTime = :start
				, endTime = :end
				, sortVal = :sort
				, speaker = :speaker
				, location = :location
				, title = :title
				, descr = :descr
				, htmldescr = :htmldescr
				, track = :track
				, active = :active
			where
				sessionId = :sessionId
		");
		q.addParam(name="start", value=arguments.startTime);
		q.addParam(name="end", value=arguments.endTime);
		q.addParam(name="sort", value=arguments.sortVal);
		q.addParam(name="speaker", value=arguments.speaker);
		q.addParam(name="location", value=arguments.location);
		q.addParam(name="title", value=arguments.title);
		q.addParam(name="descr", value=arguments.descr);
		q.addParam(name="htmldescr", value=arguments.htmldescr);
		q.addParam(name="track", value=arguments.track);
		q.addParam(name="active", value=arguments.active, cfsqltype="cf_sql_bit");
		q.addParam(name="sessionId", value=arguments.sessionId);

		return q.execute().getResult();
	}

}