component {

	function list(){
		local.q = new Query();

		q.setSql("
			select
				trackId
				, trackName
				, primaryBG
				, primaryColor
				, secondaryBG
				, secondaryColor
			from
				tblTracks
			order by
				trackName
		");

		return q.execute().getResult();
	}

	function get(id){
		local.q = new Query();

		q.setSql("
			select
				trackId
				, trackName
				, primaryBG
				, primaryColor
				, secondaryBG
				, secondaryColor
			from
				tblTracks
			where
				( trackId = :id )
		");
		q.addParam(name="id", value=arguments.id);

		return q.execute().getResult();
	}

	function insert(trackName, primaryBG, primaryColor, secondaryBG, secondaryColor){
		local.q = new Query();

		q.setSql("
			insert into
				tblTracks
				( trackName, primaryBG, primaryColor, secondaryBG, secondaryColor )
			values
				( :trackName, :primaryBG, :primaryColor, :secondaryBG, :secondaryColor )
		");
		q.addParam(name="trackName", value=arguments.trackName);
		q.addParam(name="primaryBG", value=arguments.primaryBG);
		q.addParam(name="primaryColor", value=arguments.primaryColor);
		q.addParam(name="secondaryBG", value=arguments.secondaryBG);
		q.addParam(name="secondaryColor", value=arguments.secondaryColor);

		return q.execute().getResult();
	}

	function update(trackId, trackName, primaryBG, primaryColor, secondaryBG, secondaryColor){
		local.q = new Query();

		q.setSql("
			update
				tblTracks
			set
				trackName = :trackName
				, primaryBG = :primaryBG
				, primaryColor = :primaryColor
				, secondaryBG = :secondaryBG
				, secondaryColor = :secondaryColor
			where
				trackId = :trackId
		");
		q.addParam(name="trackName", value=arguments.trackName);
		q.addParam(name="primaryBG", value=arguments.primaryBG);
		q.addParam(name="primaryColor", value=arguments.primaryColor);
		q.addParam(name="secondaryBG", value=arguments.secondaryBG);
		q.addParam(name="secondaryColor", value=arguments.secondaryColor);
		q.addParam(name="trackId", value=arguments.trackId);

		return q.execute().getResult();
	}

}