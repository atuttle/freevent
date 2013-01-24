component extends="secureController" {

	function before(rc){
		requireLoggedIn(rc);
	}

	//---------------------------------------------------------

	function list(rc){
		fw.service('tracks.list', 'trackQuery');
	}

	//---------------------------------------------------------

	function edit(rc){
		fw.service('tracks.get', 'trackQuery');
	}

	//---------------------------------------------------------

	function save(rc){
		rc.tryUpdate = false;
		rc.tryInsert = false;
		if (len(rc.trackId) > 0){
			rc.tryUpdate = true;
			fw.service('tracks.update', 'data');
		}else{
			rc.tryInsert = true;
			fw.service('tracks.insert', 'data');
		}
		return rc;
	}

	function endSave(rc){
		if (rc.tryUpdate){
			rc.msg = "Track updated successfully";
		}else{
			rc.msg = "Track created successfully";
		}
		fw.redirect(action='tracks.list', preserve='msg');
	}

	//---------------------------------------------------------

	private function cleanTags(before){
		return reReplace(before, '<[^>]+>', '', 'ALL');
	}

}