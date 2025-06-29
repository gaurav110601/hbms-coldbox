/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="numeric";
	property name="BCrypt" inject="BCrypt@BCrypt";

	// Validation Constraints
	this.constraints = {
		// Example: age = { required=true, min="18", type="numeric" }
	};

	// Constraint Profiles
	this.constraintProfiles = {
		"update" : {}
	};

	// Population Control
	this.population = {
		include : [],
		exclude : [ "id" ]
	};

	// Mementifier
	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = [ "*" ],
		// An array of properties/relationships to exclude by default
		defaultExcludes = [],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {}
	};

	/**
	 * Constructor
	 */
	loginService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}

	public struct function doLogin(required string email, required string password){
		var loc = {};
		loc.returnObject = { success: false, message: "", adminID : 0 };
		loc.q = new query();
		loc.q.addParam(name="email",value=arguments.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="password",value=arguments.password,CFSQLTYPE="cf_sql_varchar");
		/* loc.sql = 'SELECT * FROM users WHERE email=:email AND status=1'; */
		loc.sql = 'SELECT * FROM admins WHERE email=:email';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		
		if(loc.result.recordCount EQ 1){
			if(arguments.password == loc.result.password){
				loc.returnObject.success = true; 
				loc.returnObject.adminID = loc.result.id; 
				loc.returnObject.adminName = loc.result.name;
				loc.returnObject.message = "Admin login successfull!"; 
				loc.encryptedPassword = variables.BCrypt.hashPassword( arguments.password );
                loc.q.addParam(name="encryptedPassword",value=loc.encryptedPassword,CFSQLTYPE="cf_sql_varchar");
				loc.sqlUpdate = 'UPDATE admins SET password=:encryptedPassword WHERE email=:email';
				loc.q.setSQL(loc.sqlUpdate);
				loc.rs = loc.q.execute();
				if(loc.rs.getPrefix().recordCount EQ 1){
					return loc.returnObject;
				}
			}

			if(left(loc.result.password, 1) EQ '$'){
				loc.isSamePassword = variables.BCrypt.checkPassword( arguments.password, loc.result.password );
	
				if(loc.isSamePassword EQ true){
					loc.returnObject.success = true; 
					loc.returnObject.adminID = loc.result.id;
					loc.returnObject.adminName = loc.result.name;
					loc.returnObject.message = "Admin login successfull!"; 
				}else{
					loc.returnObject.message = "password is invalid"; 
				}
			}else{
				loc.returnObject.message = "Invalid Password!"; 
			}
		}else{
			loc.returnObject.message = "Invalid Email!"; 
		}
		return loc.returnObject;
	}


}