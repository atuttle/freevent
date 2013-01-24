component extends="secureController" {

	function before(rc){
		requireLoggedIn(rc);
	}

	//------------------------------------------------------------------

	function startHome(rc){
		param name="rc.username" default="";
		param name="rc.password" default="";
		//plain old salted hashes aren't great, but it's a start...
		rc.passwordHash = hash(rc.password & 'fjf34J&%&K*');
		rc.tryLogin = (len(rc.username)>0);

		if (structKeyExists(session, "loggedin") && session.loggedin){
			fw.redirect(action='admin.home');
		}

		return rc;
	}

	function home(rc){
		if (rc.tryLogin){
			fw.service('security.login', 'loginResult');
		}
	}

	function endHome(rc){
		if (rc.tryLogin && rc.loginResult.success == true){
			session.loggedin = true;
			session.username = rc.username;
			if (structKeyExists(rc, "remember")){
				cookie.username = rc.username;
				cookie.loggedin = true;
			}
			fw.redirect(action='admin.home');
		}
		if (rc.tryLogin && rc.loginResult.success == false){
			rc.error = rc.loginResult.error;
		}
	}

}
