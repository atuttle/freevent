<cfsetting showdebugoutput="false" /><!DOCTYPE HTML>
<html>
<head>
	<title><cfoutput>#application.EventTitle# Schedule Admin</cfoutput></title>

	<link rel="stylesheet" href="assets/css/app.css" />
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/bootstrap-wysihtml5.css" />
	<link rel="stylesheet" href="assets/css/colorpicker.css" />
	<link rel="stylesheet" href="assets/css/table-fixed-header.css" />
	<link rel="stylesheet" href="assets/css/jquery-ui-1.9.2.custom.css" />
	<link rel="stylesheet" href="assets/css/jquery-ui-timepicker-addon.css" />
   <link rel="stylesheet" href="assets/css/bootstrap-responsive.min.css" />
	<!-- le HTML5 shim -->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<body>

<cfoutput>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="#buildUrl('admin.home')#">#application.eventTitle#</a>
				<div class="nav-collapse collapse">
					<cfif structKeyExists(session, "username")>
						<p class="navbar-text pull-right">
							Logged in as #session.username# <a href="#buildUrl('admin.logout')#" class="btn">Logout</a>
						</p>
					</cfif>
					<ul class="nav">
						<li class="active"><a href="#buildUrl('admin.home')#">Admin</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid">

		<div class="row-fluid">

			<!--- don't show left nav if not logged in --->
			<cfif structKeyExists(session, "loggedin") and session.loggedin eq true>
				<div class="span2">
					<div class="well sidebar-nav" id="sidebar">
						<ul class="nav nav-list">

							<li <cfif rc.action eq "admin.home">class="active"</cfif>><a href="#buildUrl('admin.home')#">Admin Home</a></li>

							<li class="nav-header">Sessions</li>
							<li <cfif rc.action eq "sessions.list">class="active"</cfif>><a href="#buildUrl('sessions.list')#">Sessions List</a></li>
							<li <cfif rc.action eq "sessions.new">class="active"</cfif>><a href="#buildUrl('sessions.new')#">Add Session</a></li>

							<li class="nav-header">Tracks</li>
							<li <cfif rc.action eq "tracks.list">class="active"</cfif>><a href="#buildUrl('tracks.list')#">Tracks List</a></li>
							<li <cfif rc.action eq "tracks.new">class="active"</cfif>><a href="#buildUrl('tracks.new')#">Add Track</a></li>

							<li class="nav-header">Admin Users</li>
							<li <cfif rc.action eq "users.list">class="active"</cfif>><a href="#buildUrl('users.list')#">Users List</a></li>
							<li <cfif rc.action eq "users.new">class="active"</cfif>><a href="#buildUrl('users.new')#">Add User</a></li>

							<li class="nav-header">Go Mobile</li>
							<li><a href="../">Mobile Schedule</a></li>

						</ul>
					</div><!--/.well -->
				</div><!--/span-->
			</cfif>

			<div class="span10">
				#body#
			</div><!--/span-->
		</div><!--/row-->

	</div><!--/.fluid-container-->

	<script type="text/javascript" src="assets/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="assets/js/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-wysihtml5.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript" src="assets/js/table-fixed-header.js"></script>
	<script type="text/javascript" src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery-ui-timepicker-addon.js"></script>

	<script type="text/javascript">
		$(function(){
			$(".date-time-picker").datetimepicker();
			$('.table-fixed-header').fixedHeader();
			$(".wizzywig").wysihtml5({'font-styles': false, link: false, image: false});
			$(".colorpicker").colorpicker({format: 'hex'});

			$(document).on("click", ".confirmDelete", function(e){
				if (!confirm("Are you sure you want to delete this message?")){
					//cancel when CANCEL button is pressed
					e.preventDefault();
				}
			});
		});
	</script>

	<cfparam name="request.htmlfoot" default="" />
	#request.htmlfoot#
</cfoutput>
</body>