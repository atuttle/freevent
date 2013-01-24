<cfif structKeyExists(request.exception, "cause")
		and structKeyExists(request.exception.cause, "message")>
	<cfset local.msg = request.exception.cause.message />
<cfelse>
	<cfset local.msg = request.exception.message />
</cfif>

<cfmail
	from="#application.errorEmail#"
	to="#application.errorEmail#"
	subject="Freevent Error: #local.msg#"
	type="html"
>
	<cfoutput>#now()#</cfoutput><br/><br/>
	<cfdump var="#request.exception#" format="text" />
</cfmail>

<h2>I don't even...</h2>

	<div class="span7">
		<h4>Sorry about that. Looks like the tubes are broken.</h4>
		<p>
			As much as we try to prevent them, these things happen from time to time. And <strong>it's totally our fault.</strong>
		</p>
		<p>
			Rest assured that we've already been emailed, tweeted, instant-messaged, super-poked, and carrier-pigeoned with detailed
			information about this issue and we're hard at work fixing it. But if you want to reach out and choke someone anyway,
			<a href="mailto:<cfoutput>#application.errorEmail#</cfoutput>">we're here for that too</a>.
		</p>
		<p>
			On the off chance that we might need to ask you for it, here's a little bit of information about the error:
		</p>
		<ul>
			<li>Message: <cfoutput>#request.exception.cause.message#</cfoutput></li>
			<li>Detail: <cfoutput>#request.exception.cause.detail#</cfoutput></li>
		</ul>
	</div>


<div class="span4">
	<img src="assets/img/tysonreaction.gif" />
</div>

<cfdump var="#request.exception#" />