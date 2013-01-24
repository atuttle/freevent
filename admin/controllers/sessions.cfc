component extends="secureController" {

	function before(rc){
		requireLoggedIn(rc);
	}

	//---------------------------------------------------------

	function list(rc){
		fw.service('sessions.list', 'sessionQuery');
	}

	//---------------------------------------------------------

	function edit(rc){
		fw.service('sessions.get', 'sessionQuery');
		fw.service('tracks.list', 'trackQuery');
	}

	//---------------------------------------------------------

	function new(rc){
		fw.service('tracks.list', 'trackQuery');
	}

	//---------------------------------------------------------

	function startSave(rc){
		rc.descr = cleanTags(rc.htmldescr);
		param name="rc.active" default="0";

		rc.startTime = dateFormat(rc.startTime, 'yyyy-mm-dd') & ' ' & timeFormat(rc.startTime, 'HH:mm:ss');
		rc.endTime = dateFormat(rc.endTime, 'yyyy-mm-dd') & ' ' & timeFormat(rc.endTime, 'HH:mm:ss');

		return rc;
	}

	function save(rc){
		rc.tryUpdate = false;
		rc.tryInsert = false;
		if (len(rc.sessionId) > 0){
			rc.tryUpdate = true;
			fw.service('sessions.update', 'data');
		}else{
			rc.tryInsert = true;
			fw.service('sessions.insert', 'data');
		}
		return rc;
	}

	function endSave(rc){
		if (rc.tryUpdate){
			rc.msg = "Session updated successfully";
		}else{
			rc.msg = "Session created successfully";
		}
		fw.redirect(action='sessions.list', preserve='msg');
	}

	//---------------------------------------------------------

	private function cleanTags(before){
		return reReplace(before, '<[^>]+>', '', 'ALL');
	}

}