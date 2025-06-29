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
		loc.returnObject = { success: false, message: "", user_id : 0 };
		loc.q = new query();
		loc.q.addParam(name="email",value=arguments.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="password",value=arguments.password,CFSQLTYPE="cf_sql_varchar");
		/* loc.sql = 'SELECT * FROM users WHERE email=:email AND status=1'; */
		loc.sql = 'SELECT * FROM users WHERE email=:email';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		
		if(loc.result.recordCount EQ 1){
			if(arguments.password == loc.result.password){
				loc.returnObject.success = true; 
				loc.returnObject.userID = loc.result.id; 
				loc.returnObject.userName = loc.result.name;
				loc.returnObject.message = "User login successfull!"; 
				loc.encryptedPassword = variables.BCrypt.hashPassword( arguments.password );
				loc.sqlUpdate = 'UPDATE users SET password="#loc.encryptedPassword#" WHERE email="#arguments.email#"';
				loc.q.setSQL(loc.sqlUpdate);
				loc.rs = loc.q.execute();
				if(loc.rs.getPrefix().recordCount EQ 1){
					return loc.returnObject;
				}
			}
			loc.isSamePassword = variables.BCrypt.checkPassword( arguments.password, loc.result.password );

			if(loc.isSamePassword EQ true){
				loc.returnObject.success = true; 
				loc.returnObject.userID = loc.result.id;
				loc.returnObject.userName = loc.result.name;
				/* loc.returnObject.message = "User login successfully";  */
			}else{
				loc.returnObject.message = "password is invalid"; 
			}
		}else{
			loc.returnObject.message = "Invalid Email!"; 
		}
		return loc.returnObject;
	}

	public numeric function doRegister(required struct formData){
		var loc = {};
		loc.rV = 0;
		loc.q = new query();
		loc.sql = 'SELECT * FROM users WHERE email="#arguments.formdata.email#"';
		loc.q.setSQL(loc.sql);
		loc.result = loc.q.execute().getPrefix().recordCount;
		if(loc.result GT 0){
			return loc.rV;
		}
		loc.encryptedPassword = variables.BCrypt.hashPassword( arguments.formData.password );
		loc.q.addParam(name="name",value=arguments.formData.name,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="mobileNumber",value=arguments.formData.mobileNumber,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="email",value=arguments.formData.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="password",value=loc.encryptedPassword,CFSQLTYPE="cf_sql_varchar");

		loc.sql = 'INSERT INTO users SET name=:name, mobileNumber=:mobileNumber, email=:email, password=:password';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}

	public numeric function doRoomBooking(required struct formData){
		var loc = {};
		loc.rV = 0;
		loc.q = new query();
		loc.q.addParam(name="userID",value=arguments.formData.userID,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="roomID",value=arguments.formData.roomID,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="bookingNumber",value=dateTimeFormat(now(), "yyyymmddHHmmss"),CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="name",value=arguments.formData.name,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="mobileNumber",value=arguments.formData.mobileNumber,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="email",value=arguments.formData.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="idType",value=arguments.formData.idType,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="gender",value=arguments.formData.gender,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="address",value=arguments.formData.address,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="checkInDate",value=arguments.formData.checkInDate,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="checkOutDate",value=arguments.formData.checkOutDate,CFSQLTYPE="cf_sql_varchar");
		
		loc.sql = 'INSERT INTO booking SET bookingNumber=:bookingNumber, name=:name, mobileNumber=:mobileNumber, email=:email, idType=:idType, gender=:gender, address=:address, checkInDate=:checkInDate, checkOutDate=:checkOutDate, roomID=:roomID, userID=:userID';
		loc.q.setSQL(loc.sql);
		loc.rV = loc.q.execute().getPrefix().recordCount;
		return loc.rV;
	}

	/**
	 * User Bookings
	 */ 
    public query function userBookings(required numeric id){
		var loc = {};
		loc.q = new query();

		loc.sql = 'SELECT * FROM booking WHERE userID = #id#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.userBookingsData = loc.result;
		
		return loc.userBookingsData;
	}	
	
	/**
	 * View Bookings
	 */
    public struct function viewBooking( required numeric id ){
		var loc = {};
		var loc.viewBooking = {};
		loc.q = new query();

        /* View Booking Data */
		loc.sql = 'SELECT * FROM booking WHERE id = #id#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.viewBooking.bookingData = loc.result;
		
		loc.sql = 'SELECT * FROM rooms WHERE id = #loc.viewBooking.bookingData.roomID#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
        loc.viewBooking.roomData = loc.result;
		
		return loc.viewBooking;
	}
	
	public query function getUser( required numeric userID ){
		var loc = {};
		loc.q = new query();
		loc.sql = 'SELECT * FROM users WHERE id=#userID#';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		return loc.result;
	}

	public struct function profileUpdate( required struct formData ){
		var loc = {};
		loc.result = { success: false, message: ""};
		loc.q = new query();
		loc.q.addParam(name="userID",value=arguments.formData.userID,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="name",value=arguments.formData.name,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="email",value=arguments.formData.email,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="mobileNumber",value=arguments.formData.mobileNumber,CFSQLTYPE="cf_sql_varchar");
		loc.sql = 'SELECT * FROM users WHERE email=:email AND id!=:userID';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute().getResult();

		if(loc.rs.recordcount EQ 1){
			loc.result.success = false;
			loc.result.message = "email already exists!!";
			return loc
		}

		loc.sql = 'UPDATE users SET name=:name, email=:email, mobileNumber=:mobileNumber WHERE id=:userID';
		loc.q.setSQL(loc.sql);
		loc.rs = loc.q.execute();

		loc.result.success = true;
		loc.result.message = "profile updated successfully";

		return loc;
	}

	public struct function passwordUpdate( required struct formData ){
		var loc = {};
		loc.result1 = { success: false, message: ""};
		loc.q = new query();
		loc.q.addParam(name="userID",value=arguments.formData.userID,CFSQLTYPE="cf_sql_varchar");
		/* loc.q.addParam(name="oldPassword",value=arguments.formData.oldPassword,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="newPassword",value=arguments.formData.newPassword,CFSQLTYPE="cf_sql_varchar");
		loc.q.addParam(name="confirmPassword",value=arguments.formData.confirmPassword,CFSQLTYPE="cf_sql_varchar"); */

		loc.sql = 'SELECT * FROM users WHERE id=:userID';
		loc.q.setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();

		/* loc.encryptedPassword = variables.BCrypt.hashPassword( arguments.formData.oldPassword ); */

		if(loc.result.password == arguments.formData.oldPassword || variables.BCrypt.checkPassword( arguments.formData.oldPassword, loc.result.password )){
			if(loc.result.password == arguments.formData.newPassword || variables.BCrypt.checkPassword( arguments.formData.newPassword, loc.result.password )){
				loc.result1.message = "new password is same as previous";
				return loc;
			}else{
				if(arguments.formData.newPassword == arguments.formData.confirmPassword){
					loc.encryptedPassword = variables.BCrypt.hashPassword( arguments.formData.newPassword );
					loc.q.addParam(name="encryptedPassword",value=loc.encryptedPassword,CFSQLTYPE="cf_sql_varchar");

					loc.sql = 'UPDATE users SET password=:encryptedPassword WHERE id=:userID';
					loc.q.setSQL(loc.sql);
					loc.rs = loc.q.execute();

					loc.result1.success = true;
					loc.result1.message = "Password Changed successfully";
					return loc;
				}else{
					loc.result1.message = "new password and confirm password doesn't match";
					return loc;
				}
			}
		}else{
			loc.result1.message = "old password doesn't match";
			return loc;
		}
		
		
	}


}