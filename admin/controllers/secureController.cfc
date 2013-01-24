component {

	function init(fw){
		variables.fw = arguments.fw;
	}

	function requireLoggedIn(rc){
		//prevent infinite looping
		if (rc.action neq "main.home" and rc.action neq "main.error" and rc.action neq "admin.logout"){
			if (structKeyExists(cookie, "loggedin")){
				session.loggedin = cookie.loggedin;
			}
			if (structKeyExists(cookie, "username")){
				session.username = cookie.username;
			}
			//require login for everything but the login page
			if (structKeyExists(session, "loggedin")){
				if (session.loggedin == true){
					//noop
				}else{
					fw.redirect(action='main.home');
				}
			}else{
				fw.redirect(action='main.home');
			}
		}
	}

}