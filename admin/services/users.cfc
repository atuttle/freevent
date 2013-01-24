component {

	function list(){
		local.q = new Query();

		q.setSql("
			select
				userId
				, username
				, active
			from
				tblAdminUsers
			order by
				active DESC
				, username ASC
		");

		return q.execute().getResult();
	}

	function get(id){
		local.q = new Query();

		q.setSql("
			select
				userId
				, username
				, passwordHash
				, active
			from
				tblAdminUsers
			where
				( userId = :id )
		");
		q.addParam(name="id", value=arguments.id);

		return q.execute().getResult();
	}

	function insert(username, passwordHash, active){
		local.q = new Query();

		arguments.active = (arguments.active eq true or arguments.active eq 'yes') ? 1 : 0;

		q.setSql("
			insert into
				tblAdminUsers
				( username, passwordHash, active )
			values
				( :username, :passwordHash, :active )
		");
		q.addParam(name="username", value=arguments.username);
		q.addParam(name="passwordHash", value=arguments.passwordHash);
		q.addParam(name="active", value=arguments.active, cfsqltype="cf_sql_bit");

		return q.execute().getResult();
	}

	function update(userId, username, active){
		local.q = new Query();

		arguments.active = (arguments.active eq true or arguments.active eq 'yes') ? 1 : 0;

		q.setSql("
			update
				tblAdminUsers
			set
				username = :username
				, active = :active
			where
				userId = :userId
		");
		q.addParam(name="username", value=arguments.username);
		q.addParam(name="active", value=arguments.active, cfsqltype="cf_sql_bit");
		q.addParam(name="userId", value=arguments.userId);

		return q.execute().getResult();
	}

	function resetPassword(userId, passwordHash){
		local.q = new Query();

		q.setSql("
			update
				tblAdminUsers
			set
				passwordHash = :passwordHash
			where
				userId = :userId
		");
		q.addParam(name="passwordHash", value=arguments.passwordHash);
		q.addParam(name="userId", value=arguments.userId);

		return q.execute().getResult();
	}

}