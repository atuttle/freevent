component {

	function login(username, passwordHash){

		/*
			returns: { success: boolean, error: string, user: structure }
		*/

		local.q = new Query(maxrows=1);
		//newer records supercede older records
		q.setSql("
			select
				username
			from
				tblAdminUsers
			where
				( username = :username )
				and ( passwordHash = :pass )
			order by
				userId DESC
		");
		q.addParam(name="username", value=arguments.username);
		q.addParam(name="pass", value=arguments.passwordHash);

		local.user = q.execute().getResult();

		local.result = {};
		result.success = (user.recordCount == 1);
		result.error = (user.recordCount == 0) ? "Bad password or username not found" : "";
		result.user = QueryToArrayOfStructures(user);

		return result;

	}

	private function QueryToArrayOfStructures(theQuery){
		var theArray = arraynew(1);
		var cols = ListtoArray(theQuery.columnlist);
		var row = 1;
		var thisRow = "";
		var col = 1;
		for(row = 1; row LTE theQuery.recordcount; row = row + 1){
			thisRow = structnew();
			for(col = 1; col LTE arraylen(cols); col = col + 1){
				thisRow[cols[col]] = theQuery[cols[col]][row];
			}
			arrayAppend(theArray,duplicate(thisRow));
		}
		return(theArray);
	}

}