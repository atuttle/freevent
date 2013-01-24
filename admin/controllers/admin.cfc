component extends="secureController" {

	function before(rc){
		requireLoggedIn(rc);
	}

	function logout(){
		structDelete(session, "loggedin");
		structDelete(session, "username");
		structDelete(cookie, "loggedin");
		structDelete(cookie, "username");
		fw.redirect(action='main.home');
	}

}