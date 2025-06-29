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
	ProfileService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}

	
	/**
	 * Profile
	 */
	public query function profile( adminID ){
		var loc = {};
		loc.q = new query();

		loc.sql = 'SELECT * FROM admins WHERE id=#adminID#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();

		return loc.result;
	}

	/**
	 * Profile Update
	 */
	public struct function profileUpdate( required struct formData ){
		var loc = {};
		loc.result = { success: false, message: ""};
		loc.q = new query();
		loc.q.addParam(name="id",value=arguments.formData.id,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="name",value=arguments.formData.name,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="email",value=arguments.formData.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="mobileNumber",value=arguments.formData.mobileNumber,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="gender",value=arguments.formData.gender,CFSQLTYPE="cf_sql_varchar");
		loc.sql = 'UPDATE admins SET name=:name, email=:email, mobileNumber=:mobileNumber, gender=:gender WHERE id=:id';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute();

		loc.result.success = true;
		loc.result.message = "Profile Updated Successfully";

		return loc.result;
	}

	/**
	 * Password Update
	 */
	public struct function passwordUpdate( required struct formData ){
		var loc = {};
		loc.result1 = { success: false, message: ""};
		loc.q = new query();
		loc.q.addParam(name="adminID",value=arguments.formData.adminID,CFSQLTYPE="cf_sql_varchar");
		/* loc.q.addParam(name="oldPassword",value=arguments.formData.oldPassword,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="newPassword",value=arguments.formData.newPassword,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="confirmPassword",value=arguments.formData.confirmPassword,CFSQLTYPE="cf_sql_varchar"); */
		
		loc.sql = 'SELECT * FROM admins WHERE id=:adminID';
		loc.q.setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		
		
		if(loc.result.password == arguments.formData.oldPassword || variables.BCrypt.checkPassword( arguments.formData.oldPassword, loc.result.password )){
			if(loc.result.password == arguments.formData.newPassword || variables.BCrypt.checkPassword( arguments.formData.newPassword, loc.result.password )){
				loc.result1.message = "new password is same as previous";
				return loc.result1;
			}else{
				if(arguments.formData.newPassword == arguments.formData.confirmPassword){
					loc.encryptedPassword = variables.BCrypt.hashPassword( arguments.formData.newPassword );
					loc.q.addParam(name="encryptedPassword",value=loc.encryptedPassword,CFSQLTYPE="cf_sql_varchar");

					loc.sql = 'UPDATE admins SET password=:encryptedPassword WHERE id=:adminID';
					loc.q.setSQL(loc.sql);
					loc.rs = loc.q.execute();

					loc.result1.success = true;
					loc.result1.message = "Password Changed successfully";
					return loc.result1;
				}else{
					loc.result1.message = "new password and confirm password doesn't match";
					return loc.result1;
				}
			}
		}else{
			loc.result1.message = "old password doesn't match";
			return loc.result1;
		}
		
		
	}

	
}