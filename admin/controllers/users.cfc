component extends="secureController" {

	function before(rc){
		requireLoggedIn(rc);
	}

	//---------------------------------------------------------

	function list(rc){
		fw.service('users.list', 'userQuery');
	}

	//---------------------------------------------------------

	function edit(rc){
		fw.service('users.get', 'userQuery');
	}

	//---------------------------------------------------------

	function startSave(rc){
		param name="rc.active" default="0";
		rc.username = cleanTags(rc.userName);

		if (structKeyExists(rc, "password")){
			rc.passwordHash = hash(rc.password & 'fjf34J&%&K*');
		}

		return rc;
	}

	function save(rc){
		rc.tryUpdate = false;
		rc.tryInsert = false;
		if (len(rc.userId) > 0){
			rc.tryUpdate = true;
			fw.service('users.update', 'data');
		}else{
			rc.tryInsert = true;
			fw.service('users.insert', 'data');
		}
		return rc;
	}

	function endSave(rc){
		if (rc.tryUpdate){
			rc.msg = "User updated successfully";
		}else{
			rc.msg = "User created successfully";
		}
		fw.redirect(action='users.list', preserve='msg');
	}

	//---------------------------------------------------------

	function startResetPassword(rc){
		rc.passwordHash = hash(rc.password & 'fjf34J&%&K*');
		return rc;
	}

	function resetPassword(rc){
		fw.service('users.resetPassword', 'data');
	}

	function endResetPassword(rc){
		rc.msg = "Password updated successfully";
		fw.redirect(action='users.list', preserve='msg');
	}

	//---------------------------------------------------------

	private function cleanTags(before){
		return reReplace(before, '<[^>]+>', '', 'ALL');
	}

}