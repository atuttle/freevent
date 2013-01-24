<cfcomponent extends="framework">
<cfscript>

	this.name = "freevent_event_manager";
	this.datasource = "freevent_prototype";

	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.applicationTimeout = createTimeSpan(0,8,0,0);

	variables.framework = {
		defaultItem = 'home'
		,reloadApplicationOnEveryRequest = true
	};

	function setupApplication(){
		application.eventTitle = "Your Event Name Here";
		application.errorEmail = "you@yourdomain.com";

		return true;
	}

</cfscript>
</cfcomponent>